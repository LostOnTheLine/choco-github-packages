$ErrorActionPreference = 'Stop'
$packageName = 'explorerpatcher'

# Fetch latest release
$releases = Invoke-RestMethod -Uri 'https://api.github.com/repos/valinet/ExplorerPatcher/releases/latest'
$version = $releases.tag_name -replace '^v', ''
$arch = if ([System.Runtime.InteropServices.RuntimeInformation]::ProcessArchitecture -eq 'Arm64') { 'arm64' } else { 'x64' }
$asset = $releases.assets | Where-Object { $_.name -eq "ep_setup_$arch.exe" } | Select-Object -First 1
$url = $asset.browser_download_url
$checksum = (Invoke-WebRequest -Uri $url -Method Head -UseBasicParsing | Select-Object -ExpandProperty Headers.'Content-MD5').ToUpper()
$checksumType = 'md5'

# Parse install directory
$packageParameters = $env:ChocolateyPackageParameters
$installDir = if ($packageParameters -match '/InstallDir:(\S+)') { $matches[1] } else { 'C:\Program Files\ExplorerPatcher' }

$packageArgs = @{
    packageName   = $packageName
    fileType      = 'exe'
    url           = $url
    silentArgs    = "/quiet /norestart INSTALLDIR=`"$installDir`""
    softwareName  = 'ExplorerPatcher*'
    checksum      = $checksum
    checksumType  = $checksumType
}

Install-ChocolateyPackage @packageArgs