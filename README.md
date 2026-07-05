# cad-viewer-ad-cleaner

Cleaned rebuild workflow for `cad看图王.apk`.

## Build

Run from the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1 -ProxyPort 7897 -Clean
```

Output:

```text
dist\cad-noads-minimal-collide-aligned-signed.apk
```

The build script downloads local tool jars into `.tools/`, creates temporary files in `.tmp/` and `out/`, then writes the final APK to `dist/`. Those generated directories are ignored by Git.

## Requirements

- PowerShell
- Python
- OpenSSL
- Java 17 or `java` in `PATH`

