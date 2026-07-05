# cad-viewer-ad-cleaner

<div align="center">

[![Release](https://img.shields.io/github/v/release/Mer3y1338/cad-viewer-ad-cleaner?style=flat-square)](https://github.com/Mer3y1338/cad-viewer-ad-cleaner/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/Mer3y1338/cad-viewer-ad-cleaner/total?style=flat-square)](https://github.com/Mer3y1338/cad-viewer-ad-cleaner/releases)
![Android](https://img.shields.io/badge/Android-APK-3ddc84?style=flat-square)
![apktool](https://img.shields.io/badge/apktool-repackaging-blue?style=flat-square)
![PowerShell](https://img.shields.io/badge/PowerShell-build-5391fe?style=flat-square)
![Python](https://img.shields.io/badge/Python-patch-3776ab?style=flat-square)

CAD 看图王 APK 去广告重打包流程。基于 apktool 反编译工程，移除开屏广告入口，保留加固壳兼容性，并提供一键构建脚本和 MuMu 模拟器测试记录。

[⬇️ 下载 Release APK](https://github.com/Mer3y1338/cad-viewer-ad-cleaner/releases/latest) · [构建脚本](build.ps1) · [测试记录](FINAL_TEST_REPORT.md)

</div>

## 关键词

`CAD 看图王` · `Android APK` · `apktool` · `去广告` · `开屏广告` · `Android 重打包` · `APK signing` · `PowerShell` · `Python` · `MuMu 模拟器`

## 已实现内容

- 移除/禁用广告 SDK 相关的 Manifest 组件。
- 移除开屏页 `AppSplashActivity` 的启动入口。
- 将启动入口改为主界面 `MainActivityHome`。
- 保留加固壳需要的原始 payload、资源和 native 库，避免重打包后无法启动。
- 生成与原始签名 `Signature.hashCode()` 一致的本地签名证书，绕过壳的重签名崩溃检查。

## 说明

本仓库记录 Android APK 重打包、Manifest 补丁、签名兼容和模拟器测试流程。仓库不包含原始 APK，原始安装包需由使用者自行提供。

## 一键构建

先把原始 APK 放到仓库根目录，例如：

```text
cad看图王.apk
```

原始 APK 是本地输入文件，可能包含第三方平台标识和较大的二进制内容，已通过 `.gitignore` 排除，不会提交到 GitHub。

在仓库根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1 -ProxyPort 7897 -Clean
```

如果不需要代理：

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1 -NoProxy -Clean
```

构建成功后输出：

```text
dist\cad-noads-minimal-collide-aligned-signed.apk
```

## 构建依赖

本机需要有：

- PowerShell
- Python
- OpenSSL
- Java 17，或 `java` 已加入 `PATH`

构建脚本会自动下载：

- `apktool.jar`
- `uber-apk-signer.jar`

下载位置为 `.tools/`，该目录不会提交到 Git。

## 目录说明

```text
.
├── apktool_src/                         # apktool 反编译后的工程
├── scripts/
│   ├── patch_ads.py                     # Manifest 去广告/改启动入口补丁
│   ├── build_minimal_patch.py           # 保留原 APK payload 的最小重打包脚本
│   └── make_signature_hash_keystore.py  # 生成签名 hash 兼容的本地证书
├── build.ps1                            # 一键构建脚本
├── FINAL_TEST_REPORT.md                 # 安装和启动测试记录
└── cad看图王.apk                         # 原始 APK，本地放置，不提交
```

生成目录：

```text
.tools/    # 自动下载的工具
.tmp/      # 构建临时文件
out/       # 未签名中间 APK
dist/      # 最终成品 APK
```

这些生成目录都已被 `.gitignore` 忽略。

## 测试结果

已在 MuMu 模拟器上验证：

- APK 安装成功。
- 启动后直接进入 `com.stone.app.ui.activity.MainActivityHome`。
- 不再进入 `com.stone.app.ui.activity.AppSplashActivity` 开屏入口。
- 启动日志中未出现 `Fatal signal`、`FATAL EXCEPTION`、`UnsatisfiedLinkError`、`sigCheck` 崩溃。

详见：

```text
FINAL_TEST_REPORT.md
```

## 友链
【感谢Linux.do社区及GitHub社区各位开发者对项目的支持与贡献】
