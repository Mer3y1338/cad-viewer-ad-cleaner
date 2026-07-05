# cad-viewer-ad-cleaner

`cad-viewer-ad-cleaner` 是一个针对 `cad看图王.apk` 的本地重打包/去广告构建仓库。

本仓库保留了已反编译的 APK 结构、补丁脚本和一键构建脚本，用于生成一个可安装、可启动、跳过开屏广告入口的 APK。

## 已实现内容

- 移除/禁用广告 SDK 相关的 Manifest 组件。
- 移除开屏页 `AppSplashActivity` 的启动入口。
- 将启动入口改为主界面 `MainActivityHome`。
- 保留加固壳需要的原始 payload、资源和 native 库，避免重打包后无法启动。
- 生成与原始签名 `Signature.hashCode()` 一致的本地签名证书，绕过壳的重签名崩溃检查。

## 一键构建

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
└── cad看图王.apk                         # 原始 APK
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

## 上传 GitHub 说明

`dist/` 默认不会被提交到 Git。建议：

1. 代码推送到 GitHub 仓库。
2. 构建出的 APK 作为 GitHub Release 附件上传。

推送示例：

```powershell
git remote add origin 你的GitHub仓库地址
git push -u origin main
```

