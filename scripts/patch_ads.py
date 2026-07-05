import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / 'apktool_src'
MANIFEST = SRC / 'AndroidManifest.xml'
ANDROID_NS = 'http://schemas.android.com/apk/res/android'
A = '{%s}' % ANDROID_NS
ET.register_namespace('android', ANDROID_NS)

AD_PREFIXES = tuple(s.lower() for s in [
    'com.stone.ad.',
    'com.qq.e.',
    'com.bytedance.sdk.openadsdk.',
    'com.bytedance.msdk.',
    'com.bytedance.pangle.',
    'com.bytedance.android.openliveplugin.',
    'com.byted.live.lite.',
    'com.ss.android.downloadlib.',
    'com.ss.android.socialbase.',
    'com.baidu.mobads.',
    'com.sigmob.',
    'com.yd.saas.',
    'com.hailiang.',
    'com.sy.adsdk.',
    'com.beizi.ad.',
    'com.ptg.',
    'com.hxad.sdk.ling.',
    'cj.mobile.wm.',
    'com.wangmai.',
    'cn.haorui.sdk.',
    'com.my.adpoymer.',
    'com.kwad.',
    'com.kwai.auth.login.kwailogin.',
    'com.jd.ad.',
    'com.my.ubudget.',
    'com.meishu.sdk.',
    'com.bun.miitmdid.',
])

AD_EXACT_COMPONENTS = set(s.lower() for s in [
    'com.stone.app.ui.activity.AppAdDetailActivityTest',
    'com.stone.app.ui.activity.AppSettingAdTestActivity',
])

AD_AUTHORITY_MARKERS = tuple(s.lower() for s in [
    'gdt.fileprovider',
    'ttfileprovider',
    'ttmultiprovider',
    'bd.provider',
    'sigprovider',
    'cpcfileprovider',
    'sysdkfileprovider',
    'cjAdFileProvider',
    'lywmLifecycleProvider',
    'lywmfileprovider',
    'FanTiApkProvider',
    'adFileProvider',
    'HRFileProvider',
    'JADMultiProvider',
    'UbixDataContentProvider',
    'pangle.',
    'initprovider',
    'update.provider',
])

AD_PERMISSION_MARKERS = tuple(s.lower() for s in [
    'openadsdk.permission.tt_pangolin',
    'sy.adsdk',
])

ASSET_REMOVE = [
    'assets/ad_mate_error.png',
    'assets/bdxadsdk.jar',
    'assets/gdt_plugin',
    'assets/hailiang',
    'assets/jad_click.json',
    'assets/jad_shake.json',
    'assets/jad_slideup.json',
    'assets/jutui',
    'assets/ksad_common_encrypt_image.png',
    'assets/ksad_idc.json',
    'assets/lottie_json',
    'assets/lywm7.13.7',
    'assets/output.json',
    'assets/syadv2',
    'assets/ubix',
    'unknown/META-INF/services/com.sy.adsdk.api.mediation.AdnAdapter',
    'unknown/META-INF/services/com.yd.saas.base.adapter.AdapterPreInitialize',
    'unknown/META-INF/services/com.yd.saas.base.adapter.MixNativeAPI',
    'unknown/META-INF/services/com.yd.saas.base.base.AdapterAPI',
    'unknown/META-INF/services/com.yd.saas.base.bidding.Bidding',
]

LIB_REMOVE = [
    'lib/arm64-v8a/libavmdl_lite.so',
    'lib/arm64-v8a/liblywmAliAgainstId.so',
    'lib/arm64-v8a/libpanglearmor.so',
    'lib/arm64-v8a/libpangleflipped.so',
    'lib/arm64-v8a/libPglbizssdk_ml.so',
    'lib/arm64-v8a/libqmcheat.so',
    'lib/arm64-v8a/libsaas.so',
    'lib/arm64-v8a/libtt_ugen_layout.so',
    'lib/arm64-v8a/libttmplayer_lite.so',
]

def attr(el, name, default=''):
    return el.get(A + name, default) or default

def is_launcher_filter(intent_filter):
    has_main = False
    has_launcher = False
    for child in list(intent_filter):
        if child.tag.endswith('action') and attr(child, 'name') == 'android.intent.action.MAIN':
            has_main = True
        if child.tag.endswith('category') and attr(child, 'name') == 'android.intent.category.LAUNCHER':
            has_launcher = True
    return has_main and has_launcher

def is_ad_component(el):
    name = attr(el, 'name').lower()
    authorities = attr(el, 'authorities').lower()
    if name in AD_EXACT_COMPONENTS:
        return True
    if name.startswith(AD_PREFIXES):
        return True
    if any(m in authorities for m in AD_AUTHORITY_MARKERS):
        return True
    # Specific downloader/ad compliance classes under ByteDance use com.ss.android.* prefixes above.
    return False

def remove_manifest_ads():
    tree = ET.parse(MANIFEST)
    root = tree.getroot()
    app = root.find('application')
    removed = []

    # Drop ad-only permissions.
    for child in list(root):
        tag = child.tag.split('}', 1)[-1]
        if tag in ('uses-permission', 'permission'):
            nm = attr(child, 'name').lower()
            if any(m in nm for m in AD_PERMISSION_MARKERS):
                root.remove(child)
                removed.append(f'{tag} {nm}')

    # Remove ad SDK exported components and auto-init providers/services/receivers.
    for child in list(app):
        tag = child.tag.split('}', 1)[-1]
        if tag in ('activity', 'provider', 'service', 'receiver', 'activity-alias') and is_ad_component(child):
            removed.append(f'{tag} {attr(child, "name")} {attr(child, "authorities")}')
            app.remove(child)

    # Remove original splash launcher entry; keep any non-launcher deep links.
    splash = None
    for child in list(app):
        if child.tag.split('}', 1)[-1] == 'activity' and attr(child, 'name') == 'com.stone.app.ui.activity.AppSplashActivity':
            splash = child
            break
    if splash is not None:
        for f in list(splash):
            if f.tag.split('}', 1)[-1] == 'intent-filter' and is_launcher_filter(f):
                splash.remove(f)
                removed.append('launcher intent-filter com.stone.app.ui.activity.AppSplashActivity')

    # Add a tiny launcher that jumps directly into the home activity, bypassing splash ads.
    launcher_name = 'com.codex.clean.NoAdLauncherActivity'
    existing = [c for c in app if c.tag.split('}', 1)[-1] == 'activity' and attr(c, 'name') == launcher_name]
    if not existing:
        act = ET.Element('activity', {
            A + 'name': launcher_name,
            A + 'exported': 'true',
            A + 'label': '@string/app_name',
            A + 'theme': '@style/AppThemeSplash',
            A + 'noHistory': 'true',
        })
        filt = ET.SubElement(act, 'intent-filter')
        ET.SubElement(filt, 'action', {A + 'name': 'android.intent.action.MAIN'})
        ET.SubElement(filt, 'category', {A + 'name': 'android.intent.category.LAUNCHER'})
        # Place near splash for readability.
        insert_at = list(app).index(splash) if splash is not None else 0
        app.insert(insert_at, act)
        removed.append('added launcher com.codex.clean.NoAdLauncherActivity')

    ET.indent(tree, space='    ')
    tree.write(MANIFEST, encoding='utf-8', xml_declaration=True)
    return removed

def remove_files():
    removed = []
    for rel in ASSET_REMOVE + LIB_REMOVE:
        p = SRC / rel
        if p.is_dir():
            import shutil
            shutil.rmtree(p)
            removed.append(rel + '/')
        elif p.exists():
            p.unlink()
            removed.append(rel)
    return removed

def write_launcher_smali():
    p = SRC / 'smali' / 'com' / 'codex' / 'clean' / 'NoAdLauncherActivity.smali'
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(r'''.class public Lcom/codex/clean/NoAdLauncherActivity;
.super Landroid/app/Activity;
.source "NoAdLauncherActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/codex/clean/NoAdLauncherActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.stone.app.ui.activity.MainActivityHome"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/codex/clean/NoAdLauncherActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-virtual {p0}, Lcom/codex/clean/NoAdLauncherActivity;->finish()V

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
''', encoding='utf-8')
    return str(p.relative_to(ROOT))

if __name__ == '__main__':
    manifest_removed = remove_manifest_ads()
    strip_payload = '--strip-payload' in sys.argv
    file_removed = remove_files() if strip_payload else []
    smali = write_launcher_smali()
    report = ROOT / 'AD_REMOVAL_REPORT.md'
    report.write_text('# APK ad-removal patch report\n\n'
                      '## Launcher change\n'
                      '- Removed `MAIN`/`LAUNCHER` from `com.stone.app.ui.activity.AppSplashActivity`.\n'
                      '- Added `com.codex.clean.NoAdLauncherActivity`, which immediately starts `com.stone.app.ui.activity.MainActivityHome`.\n\n'
                      '## Manifest ad components removed\n' + ''.join(f'- `{x}`\n' for x in manifest_removed) + '\n' +
                      ('## Ad assets/native libraries removed\n' + ''.join(f'- `{x}`\n' for x in file_removed) if file_removed else '## Ad assets/native libraries\n- Preserved for installer/packer compatibility. Use `--strip-payload` only for experimental aggressive builds.\n') + '\n', encoding='utf-8')
    print(f'manifest removed/changed: {len(manifest_removed)}')
    print(f'files removed: {len(file_removed)}')
    print(f'launcher smali: {smali}')
    print(f'report: {report}')
