# Final cleaned APK test report

## Artifact

- `D:\Code\cad-viewer-ad-cleaner\dist\cad-noads-minimal-collide-aligned-signed.apk`
- Package: `com.gstarmc.android`
- Version observed on MuMu: `5.18.4` / `604`

## What changed

- Removed ad SDK manifest components/providers/receivers/services and dangling ad aliases from the decoded manifest.
- Removed `MAIN`/`LAUNCHER` from `com.stone.app.ui.activity.AppSplashActivity`.
- Made `com.stone.app.ui.activity.MainActivityHome` the launcher, so the app opens directly to the usable home screen instead of the splash/shake ad screen.
- Preserved packed payload/resources/assets for shell compatibility.
- Re-signed with a generated local certificate whose Android `Signature.hashCode()` matches the original signer, avoiding the protected shell's re-sign crash.

## Signature check evidence

- Original signer cert Java hash: `-898697681` / `0xca6ef62f`
- Final signer cert Java hash: `-898697681` / `0xca6ef62f`

## Emulator verification

Device used: MuMu / `emulator-5554`

Commands passed:

```powershell
adb -s emulator-5554 uninstall com.gstarmc.android
adb -s emulator-5554 install --no-incremental -r -d -g D:\Code\cad-viewer-ad-cleaner\dist\cad-noads-minimal-collide-aligned-signed.apk
adb -s emulator-5554 shell monkey -p com.gstarmc.android -c android.intent.category.LAUNCHER 1
```

Observed:

- Install result: `Success`
- Cold launch displayed: `com.gstarmc.android/com.stone.app.ui.activity.MainActivityHome`
- Three repeated force-stop/cold-launch runs all resumed `MainActivityHome`.
- No `Fatal signal`, `FATAL EXCEPTION`, `UnsatisfiedLinkError`, or `sigCheck` crash lines were produced during the launch test window.
- Screenshot evidence saved locally at `D:\Code\cad-viewer-ad-cleaner\.tmp\cad_noads_test_pull.png`.
