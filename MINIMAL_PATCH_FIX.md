# Minimal binary patch build

The installable output is now:

`dist/cad-noads-minimal-aligned-debugSigned.apk`

This build preserves the original packed `classes.dex`, `resources.arsc`, assets, and native libraries, and only injects a patched binary `AndroidManifest.xml`. This avoids the `INSTALL_FAILED_INVALID_APK (-2)` caused by full apktool rebuilds of a protected APK.

Manifest changes in the minimal build:

- Desktop launcher is moved from `com.stone.app.ui.activity.AppSplashActivity` to existing `com.stone.app.ui.activity.MainActivityHome`.
- `MainActivityHome` is marked `android:exported="true"` for Android 12+ launcher rules.
- Manifest-registered ad SDK components remain removed.

Build command:

```powershell
python scripts\build_minimal_patch.py
```
