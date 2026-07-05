#!/usr/bin/env python3
"""Create a signing keystore whose X.509 cert has the same Java hash as the APK's signer.

The protected APK shell checks android.content.pm.Signature.hashCode() instead
of a full certificate digest. Re-signing normally changes that 32-bit Java hash
and the shell deliberately crashes. This script generates a local signing key,
then adjusts unused bytes in the certificate's self-signature BIT STRING so the
certificate remains parseable, the public key still matches the private key, and
Signature.hashCode() matches the original APK signer.

OpenSSL is used for certificate/key generation and PKCS#12 export; no Python
crypto packages are required.
"""
from __future__ import annotations

import argparse
import base64
import math
import shutil
import subprocess
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_OUT_DIR = ROOT / ".tmp" / "certcollide"
ALIAS = "collide"
PASSWORD = "android"


def java_signature_hash(data: bytes | bytearray) -> int:
    """Return Java Arrays.hashCode(byte[]) as Android Signature.hashCode uses it."""
    h = 1
    for x in data:
        b = x if x < 128 else x - 256
        h = (31 * h + b) & 0xFFFFFFFF
    return h


def hash_signed(value: int) -> int:
    value &= 0xFFFFFFFF
    return value if value < 0x80000000 else value - 0x100000000


def find_original_apk() -> Path:
    apks = [p for p in ROOT.glob("*.apk") if p.is_file()]
    if not apks:
        raise FileNotFoundError("No original APK found in repo root")
    return apks[0]


def openssl() -> str:
    exe = shutil.which("openssl")
    if not exe:
        raise FileNotFoundError("openssl.exe not found in PATH")
    return exe


def run(cmd: list[str], cwd: Path | None = None) -> None:
    subprocess.check_call(cmd, cwd=str(cwd or ROOT))


def extract_v1_signer_cert(apk: Path, out_dir: Path) -> bytes:
    """Extract the APK's v1/JAR signer certificate DER bytes."""
    out_dir.mkdir(parents=True, exist_ok=True)
    sig_block = out_dir / "original-signer-block.der"
    pem = out_dir / "original-signer.pem"
    der = out_dir / "original-signer.der"

    with zipfile.ZipFile(apk, "r") as z:
        candidates = [
            n
            for n in z.namelist()
            if n.upper().startswith("META-INF/")
            and n.upper().endswith((".RSA", ".DSA", ".EC"))
        ]
        if not candidates:
            raise RuntimeError(f"No META-INF/*.RSA/*.DSA/*.EC signer block in {apk}")
        sig_block.write_bytes(z.read(candidates[0]))

    run([openssl(), "pkcs7", "-inform", "DER", "-in", str(sig_block), "-print_certs", "-out", str(pem)])
    run([openssl(), "x509", "-in", str(pem), "-outform", "DER", "-out", str(der)])
    return der.read_bytes()


def read_der_len(buf: bytes | bytearray, pos: int) -> tuple[int, int]:
    first = buf[pos]
    pos += 1
    if first < 0x80:
        return first, pos
    n = first & 0x7F
    val = 0
    for _ in range(n):
        val = (val << 8) | buf[pos]
        pos += 1
    return val, pos


def parse_tlv(buf: bytes | bytearray, pos: int) -> tuple[int, int, int, int, int]:
    tag = buf[pos]
    length, value_start = read_der_len(buf, pos + 1)
    return tag, pos, value_start, value_start, value_start + length


def top_level_children(buf: bytes | bytearray) -> list[tuple[int, int, int, int, int]]:
    tag, _pos, _hdr, value_start, value_end = parse_tlv(buf, 0)
    if tag != 0x30 or value_end != len(buf):
        raise ValueError("Certificate is not a single top-level DER SEQUENCE")
    out = []
    pos = value_start
    while pos < value_end:
        child = parse_tlv(buf, pos)
        out.append(child)
        pos = child[4]
    if pos != value_end or len(out) != 3:
        raise ValueError("Unexpected X.509 certificate layout")
    return out


def patch_der_to_hash(base_der: bytes, target_hash: int) -> bytes:
    """Patch bytes at the end of signatureValue so Java hash matches target."""
    data = bytearray(base_der)
    children = top_level_children(data)
    sig = children[2]
    if sig[0] != 0x03:
        raise ValueError("Certificate signatureValue is not a BIT STRING")
    unused_bits_offset = sig[3]
    if data[unused_bits_offset] != 0:
        raise ValueError("Only zero-unused-bit RSA signatures are supported")
    sig_content_start = unused_bits_offset + 1
    sig_content_end = sig[4]
    if sig_content_end != len(data):
        raise ValueError("Expected signatureValue to be the final DER field")

    modulus = 2**32
    target_hash &= 0xFFFFFFFF

    # Use the final k bytes of the RSA self-signature. These bytes are not used
    # for APK verification; Android only needs a parseable cert and matching key.
    for k in range(4, min(32, sig_content_end - sig_content_start) + 1):
        first_controlled = len(data) - k
        prefix_hash = 1
        for x in data[:first_controlled]:
            b = x if x < 128 else x - 256
            prefix_hash = (31 * prefix_hash + b) & 0xFFFFFFFF

        base = (prefix_hash * pow(31, k, modulus)) & 0xFFFFFFFF
        delta = (target_hash - base) & 0xFFFFFFFF
        weights = [31 ** (k - 1 - i) for i in range(k)]
        max_abs = sum(127 * w for w in weights)
        qmin = math.ceil((-max_abs - delta) / modulus)
        qmax = math.floor((max_abs - delta) / modulus)

        def solve_digits(value: int) -> list[int] | None:
            digits: list[int] = []
            rem = value
            for i, weight in enumerate(weights):
                rem_abs = sum(127 * w for w in weights[i + 1 :])
                lo = math.ceil((rem - rem_abs) / weight)
                hi = math.floor((rem + rem_abs) / weight)
                lo = max(lo, -128)
                hi = min(hi, 127)
                if lo > hi:
                    return None
                digit = round(rem / weight)
                digit = max(lo, min(hi, digit))
                digits.append(digit)
                rem -= digit * weight
            if rem == 0 and all(-128 <= d <= 127 for d in digits):
                return digits
            return None

        for q in range(qmin, qmax + 1):
            solved = solve_digits(delta + q * modulus)
            if solved is None:
                continue
            for off, signed_byte in zip(range(first_controlled, len(data)), solved):
                data[off] = signed_byte & 0xFF
            if java_signature_hash(data) != target_hash:
                raise AssertionError("Internal collision solver produced wrong hash")
            return bytes(data)

    raise RuntimeError("Could not solve certificate hash collision")


def write_pem(der: bytes, pem: Path) -> None:
    b64 = base64.b64encode(der).decode("ascii")
    lines = ["-----BEGIN CERTIFICATE-----"]
    lines.extend(b64[i : i + 64] for i in range(0, len(b64), 64))
    lines.append("-----END CERTIFICATE-----")
    pem.write_text("\n".join(lines) + "\n", encoding="ascii")


def create_collision_keystore(apk: Path, out_dir: Path) -> Path:
    out_dir.mkdir(parents=True, exist_ok=True)
    original_der = extract_v1_signer_cert(apk, out_dir)
    target = java_signature_hash(original_der)

    p12 = out_dir / "collide.p12"
    collide_der = out_dir / "collide.der"
    collide_pem = out_dir / "collide.pem"
    key = out_dir / "collide.key"

    if p12.exists() and collide_der.exists() and java_signature_hash(collide_der.read_bytes()) == target:
        print(
            f"Reusing {p12} with Signature.hashCode={hash_signed(target)} "
            f"(0x{target:08x})"
        )
        return p12

    base_pem = out_dir / "base.pem"
    base_der = out_dir / "base.der"

    run([openssl(), "genrsa", "-out", str(key), "2048"])
    run(
        [
            openssl(),
            "req",
            "-new",
            "-x509",
            "-key",
            str(key),
            "-out",
            str(base_pem),
            "-days",
            "36500",
            "-subj",
            "/C=CN/ST=shanxi/L=xian/O=GstarCAD/OU=Platform R&D DPT/CN=GstarCAD",
        ]
    )
    run([openssl(), "x509", "-in", str(base_pem), "-outform", "DER", "-out", str(base_der)])

    patched = patch_der_to_hash(base_der.read_bytes(), target)
    collide_der.write_bytes(patched)
    write_pem(patched, collide_pem)

    if p12.exists():
        p12.unlink()
    run(
        [
            openssl(),
            "pkcs12",
            "-export",
            "-inkey",
            str(key),
            "-in",
            str(collide_pem),
            "-out",
            str(p12),
            "-passout",
            f"pass:{PASSWORD}",
            "-name",
            ALIAS,
        ]
    )
    print(
        f"Created {p12} with Signature.hashCode={hash_signed(target)} "
        f"(0x{target:08x})"
    )
    return p12


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("apk", nargs="?", type=Path, default=find_original_apk())
    parser.add_argument("--out-dir", type=Path, default=DEFAULT_OUT_DIR)
    args = parser.parse_args()
    create_collision_keystore(args.apk.resolve(), args.out_dir.resolve())


if __name__ == "__main__":
    main()
