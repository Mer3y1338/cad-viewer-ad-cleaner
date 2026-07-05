# APK ad-removal patch report

## Current compatible build

The first aggressive build stripped embedded ad SDK payloads and native libraries. The target installer reported `INSTALL_FAILED_INVALID_APK (-2)`, so the current build preserves those payload files for compatibility with the protected/packed APK.

## Active ad suppression

- Removed the desktop launcher intent-filter from `com.stone.app.ui.activity.AppSplashActivity`.
- Added `com.codex.clean.NoAdLauncherActivity`, which immediately opens `com.stone.app.ui.activity.MainActivityHome`.
- Removed/disabled Manifest-registered ad SDK activities, services, receivers, and providers for GDT/Tencent Ads, Pangle/CSJ, Baidu MobAds, Kuaishou/KSAD, Sigmob, Beizi, SY/YD SaaS, JAD, Wangmai, Ubix, and related download/compliance components.
- Kept embedded payload files/native libraries so Android package parsing and packed-app startup checks do not fail before launch.

## Output

- Compatible signed APK: `dist/cad???-noads-compatible-aligned-debugSigned.apk`
