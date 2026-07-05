param(
    [int]$ProxyPort = 7897,
    [switch]$NoProxy,
    [switch]$Clean
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $Root

$ToolsDir = Join-Path $Root '.tools'
$OutApk = Join-Path $Root 'dist\cad-noads-minimal-collide-aligned-signed.apk'

$Downloads = @(
    @{
        Url  = 'https://github.com/iBotPeaches/Apktool/releases/download/v3.0.2/apktool_3.0.2.jar'
        File = Join-Path $ToolsDir 'apktool.jar'
    },
    @{
        Url  = 'https://github.com/patrickfav/uber-apk-signer/releases/download/v1.3.0/uber-apk-signer-1.3.0.jar'
        File = Join-Path $ToolsDir 'uber-apk-signer.jar'
    }
)

function Require-Command {
    param([string]$Name)
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Missing required command: $Name"
    }
}

function Download-IfMissing {
    param(
        [string]$Url,
        [string]$File
    )
    if (Test-Path -LiteralPath $File) {
        Write-Host "[ok] $File"
        return
    }

    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $File) | Out-Null
    $tmp = "$File.download"
    Remove-Item -LiteralPath $tmp -Force -ErrorAction SilentlyContinue

    $args = @{
        Uri             = $Url
        OutFile         = $tmp
        UseBasicParsing = $true
    }
    if (-not $NoProxy) {
        $args.Proxy = "http://127.0.0.1:$ProxyPort"
    }

    Write-Host "[download] $Url"
    Invoke-WebRequest @args
    Move-Item -LiteralPath $tmp -Destination $File -Force
    Write-Host "[ok] $File"
}

if ($Clean) {
    Write-Host '[clean] removing generated directories'
    foreach ($p in @('.tmp', 'out', 'dist')) {
        Remove-Item -LiteralPath (Join-Path $Root $p) -Recurse -Force -ErrorAction SilentlyContinue
    }
}

$InputApks = Get-ChildItem -LiteralPath $Root -Filter '*.apk' -File
if (-not $InputApks) {
    throw 'Missing input APK. Put the original APK in the repository root first; *.apk is intentionally ignored by Git.'
}

Require-Command python
Require-Command openssl
if (-not (Test-Path -LiteralPath 'C:\Program Files\Eclipse Adoptium\jre-17.0.19.10-hotspot\bin\java.exe')) {
    Require-Command java
}

foreach ($d in $Downloads) {
    Download-IfMissing -Url $d.Url -File $d.File
}

Write-Host '[build] generating cleaned APK'
python (Join-Path $Root 'scripts\build_minimal_patch.py')

if (-not (Test-Path -LiteralPath $OutApk)) {
    throw "Build finished but output APK was not found: $OutApk"
}

$hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $OutApk).Hash.ToLowerInvariant()
$size = (Get-Item -LiteralPath $OutApk).Length
Write-Host ''
Write-Host '[done]'
Write-Host "APK:    $OutApk"
Write-Host "Size:   $size bytes"
Write-Host "SHA256: $hash"
