#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

if ($v) {
  $Version = "v${v}"
}
if ($args.Length -eq 1) {
  $Version = $args.Get(0)
}

$HomerInstall = $env:HOMER_INSTALL
$HomerDir = if ($HomerInstall) {
  "$HomerInstall\bin"
} else {
  "$Home\.homer\bin"
}

$HomerZip = "$BinDir\homer.zip"
$HomerExe = "$BinDir\hm.exe"

# GitHub requires TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$HomerUri = "https://github.com/japrozs/homer/releases/download/0.01/windows.zip"

if (!(Test-Path $BinDir)) {
  New-Item $BinDir -ItemType Directory | Out-Null
}

Invoke-WebRequest $HomerUri -OutFile $HomerZip -UseBasicParsing

if (Get-Command Expand-Archive -ErrorAction SilentlyContinue) {
  Expand-Archive $HomerZip -Destination $BinDir -Force
} else {
  if (Test-Path $HomerExe) {
    Remove-Item $HomerExe
  }
  Add-Type -AssemblyName System.IO.Compression.FileSystem
  [IO.Compression.ZipFile]::ExtractToDirectory($HomerZip, $BinDir)
}

Remove-Item $HomerZip

$User = [EnvironmentVariableTarget]::User
$Path = [Environment]::GetEnvironmentVariable('Path', $User)
if (!(";$Path;".ToLower() -like "*;$BinDir;*".ToLower())) {
  [Environment]::SetEnvironmentVariable('Path', "$Path;$BinDir", $User)
  $Env:Path += ";$BinDir"
}

Write-Output "Homer was installed successfully to $HomerExe"
Write-Output "Run 'hm help' to get started"