#!/usr/bin/env python3
"""Build an install-compatible no-ads APK.

Why this exists: the APK is packed/protected. A normal apktool rebuild rewrites
classes.dex and resources.arsc, which can make Android report
INSTALL_FAILED_INVALID_APK (-2). This script rebuilds only a patched binary
AndroidManifest.xml, then injects that manifest into the original APK while
preserving the original packed classes.dex, resources.arsc, assets, and libs.
"""
from __future__ import annotations

import os
import shutil
import subprocess
import sys
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
APKTOOL_SRC = ROOT / "apktool_src"
TMP = ROOT / ".tmp" / "min_src"
TMP_BUILT = ROOT / ".tmp" / "min_manifest_build.apk"
UNSIGNED = ROOT / "out" / "cad-noads-minimal-collide-unsigned.apk"
SIGNED_DIR = ROOT / "dist"
SIGNED = SIGNED_DIR / "cad-noads-minimal-collide-aligned-signed.apk"
COLLIDE_DIR = ROOT / ".tmp" / "certcollide"
COLLIDE_P12 = COLLIDE_DIR / "collide.p12"
COLLIDE_ALIAS = "collide"
COLLIDE_PASSWORD = "android"

ANDROID_NS = "http://schemas.android.com/apk/res/android"
A = "{%s}" % ANDROID_NS
ET.register_namespace("android", ANDROID_NS)


def find_original_apk() -> Path:
    apks = [p for p in ROOT.glob("*.apk") if p.is_file()]
    if not apks:
        raise FileNotFoundError("No original APK found in repo root")
    return apks[0]


def java_cmd() -> str:
    bundled = Path(r"C:\Program Files\Eclipse Adoptium\jre-17.0.19.10-hotspot\bin\java.exe")
    if bundled.exists():
        return str(bundled)
    return "java"


def launcher_filter(el: ET.Element) -> bool:
    acts = [c.get(A + "name") for c in el if c.tag.split("}")[-1] == "action"]
    cats = [c.get(A + "name") for c in el if c.tag.split("}")[-1] == "category"]
    return "android.intent.action.MAIN" in acts and "android.intent.category.LAUNCHER" in cats


def prepare_min_src() -> None:
    if TMP.exists():
        shutil.rmtree(TMP)
    TMP.mkdir(parents=True)
    shutil.copy2(APKTOOL_SRC / "apktool.yml", TMP / "apktool.yml")
    shutil.copy2(APKTOOL_SRC / "AndroidManifest.xml", TMP / "AndroidManifest.xml")
    shutil.copytree(APKTOOL_SRC / "res", TMP / "res")
    shutil.copytree(APKTOOL_SRC / "smali", TMP / "smali")
    noad = TMP / "smali" / "com" / "codex"
    if noad.exists():
        shutil.rmtree(noad)

    manifest = TMP / "AndroidManifest.xml"
    tree = ET.parse(manifest)
    root = tree.getroot()
    app = root.find("application")
    if app is None:
        raise RuntimeError("No <application> in manifest")

    for child in list(app):
        if child.tag.split("}")[-1] == "activity" and child.get(A + "name") == "com.codex.clean.NoAdLauncherActivity":
            app.remove(child)

    for child in app:
        if child.tag.split("}")[-1] == "activity" and child.get(A + "name") == "com.stone.app.ui.activity.AppSplashActivity":
            for f in list(child):
                if f.tag.split("}")[-1] == "intent-filter" and launcher_filter(f):
                    child.remove(f)

    for child in app:
        if child.tag.split("}")[-1] == "activity" and child.get(A + "name") == "com.stone.app.ui.activity.MainActivityHome":
            child.set(A + "exported", "true")
            if not any(f.tag.split("}")[-1] == "intent-filter" and launcher_filter(f) for f in child):
                f = ET.Element("intent-filter")
                ET.SubElement(f, "action", {A + "name": "android.intent.action.MAIN"})
                ET.SubElement(f, "category", {A + "name": "android.intent.category.LAUNCHER"})
                child.insert(0, f)
            break
    else:
        raise RuntimeError("MainActivityHome not found")

    ET.indent(tree, space="    ")
    tree.write(manifest, encoding="utf-8", xml_declaration=True)


def build_binary_manifest() -> bytes:
    apktool = ROOT / ".tools" / "apktool.jar"
    if not apktool.exists():
        raise FileNotFoundError(apktool)
    if TMP_BUILT.exists():
        TMP_BUILT.unlink()
    subprocess.check_call([java_cmd(), "-jar", str(apktool), "b", str(TMP), "-o", str(TMP_BUILT)], cwd=ROOT)
    with zipfile.ZipFile(TMP_BUILT) as z:
        return z.read("AndroidManifest.xml")


def copy_info(src_info: zipfile.ZipInfo) -> zipfile.ZipInfo:
    zi = zipfile.ZipInfo(src_info.filename, date_time=src_info.date_time)
    zi.compress_type = src_info.compress_type
    zi.comment = src_info.comment
    zi.extra = src_info.extra
    zi.internal_attr = src_info.internal_attr
    zi.external_attr = src_info.external_attr
    zi.create_system = src_info.create_system
    return zi


def inject_manifest(original: Path, manifest_bin: bytes) -> None:
    UNSIGNED.parent.mkdir(exist_ok=True)
    with zipfile.ZipFile(original, "r") as zin, zipfile.ZipFile(UNSIGNED, "w", allowZip64=True) as zout:
        for info in zin.infolist():
            name = info.filename
            upper = name.upper()
            if name == "AndroidManifest.xml":
                zout.writestr(copy_info(info), manifest_bin)
            elif name == "META-INF/MANIFEST.MF" or upper.endswith((".SF", ".RSA", ".DSA", ".EC")):
                continue
            else:
                zout.writestr(copy_info(info), zin.read(name))
    with zipfile.ZipFile(UNSIGNED) as z:
        bad = z.testzip()
        if bad:
            raise RuntimeError(f"Bad zip entry: {bad}")


def ensure_collision_keystore(original: Path) -> None:
    helper = ROOT / "scripts" / "make_signature_hash_keystore.py"
    if not helper.exists():
        raise FileNotFoundError(helper)
    subprocess.check_call(
        [sys.executable, str(helper), str(original), "--out-dir", str(COLLIDE_DIR)],
        cwd=ROOT,
    )
    if not COLLIDE_P12.exists():
        raise FileNotFoundError(COLLIDE_P12)


def sign(original: Path) -> None:
    signer = ROOT / ".tools" / "uber-apk-signer.jar"
    if not signer.exists():
        raise FileNotFoundError(signer)
    ensure_collision_keystore(original)
    SIGNED_DIR.mkdir(exist_ok=True)
    for stale in [SIGNED, SIGNED.with_suffix(SIGNED.suffix + ".idsig")]:
        if stale.exists():
            stale.unlink()
    subprocess.check_call(
        [
            java_cmd(),
            "-jar",
            str(signer),
            "--allowResign",
            "-a",
            str(UNSIGNED),
            "-o",
            str(SIGNED_DIR),
            "--ks",
            str(COLLIDE_P12),
            "--ksAlias",
            COLLIDE_ALIAS,
            "--ksPass",
            COLLIDE_PASSWORD,
            "--ksKeyPass",
            COLLIDE_PASSWORD,
        ],
        cwd=ROOT,
    )
    produced = next(SIGNED_DIR.glob("cad-noads-minimal-collide-aligned-signed.apk"), None)
    if produced is None:
        raise RuntimeError("Signed APK was not produced")
    print(f"Signed APK: {produced}")


def main() -> None:
    original = find_original_apk()
    prepare_min_src()
    manifest_bin = build_binary_manifest()
    inject_manifest(original, manifest_bin)
    sign(original)


if __name__ == "__main__":
    main()
