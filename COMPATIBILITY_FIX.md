# Compatibility APK note

The first no-ads build removed embedded ad SDK payload files. Some Android package installers report this as `INSTALL_FAILED_INVALID_APK (-2)` on protected/packed APKs.

This compatibility build restores the embedded payload files/native libraries but keeps the actual ad suppression changes:

- Desktop launcher no longer enters `com.stone.app.ui.activity.AppSplashActivity`.
- New launcher `com.codex.clean.NoAdLauncherActivity` jumps directly to `com.stone.app.ui.activity.MainActivityHome`.
- Manifest-registered ad SDK activities/services/receivers/providers remain removed/disabled.

Output APK: `dist/cad看图王-noads-compatible-aligned-debugSigned.apk`
