# APK ad-removal patch report

## Current installable build

Use this file:

`dist/cad-noads-minimal-aligned-debugSigned.apk`

The APK is protected/packed. Full apktool rebuilds rewrote the packed `classes.dex` from ~36 MB down to a tiny stub dex, and Android reported `INSTALL_FAILED_INVALID_APK (-2)`. The current build is a minimal binary patch: it preserves the original packed `classes.dex`, `resources.arsc`, assets, native libraries, and zip payloads, and injects only a patched binary `AndroidManifest.xml`.

## Active ad suppression

- Moved the desktop launcher away from `com.stone.app.ui.activity.AppSplashActivity`.
- `com.stone.app.ui.activity.MainActivityHome` is now the launcher activity, bypassing splash/open-screen ads.
- Removed/disabled Manifest-registered ad SDK activities, services, receivers, and providers for GDT/Tencent Ads, Pangle/CSJ, Baidu MobAds, Kuaishou/KSAD, Sigmob, Beizi, SY/YD SaaS, JAD, Wangmai, Ubix, and related download/compliance components.
- Preserved embedded payload files/native libraries for installer and packed-app compatibility.

## Rebuild command

```powershell
python scripts\build_minimal_patch.py
```
