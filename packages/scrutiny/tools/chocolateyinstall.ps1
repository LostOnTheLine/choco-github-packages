$ErrorActionPreference = 'Stop'
$packageName = 'scrutiny'

# Fetch latest release
$releases = Invoke-RestMethod -Uri 'https://api.github.com/repos/AnalogJ/scrutiny/releases/latest'
$version = $releases.tag_name -replace '^v', ''
$arch = if ([System.Runtime.InteropServices.RuntimeInformation]::ProcessArchitecture -eq 'Arm64') { 'arm64' } else { 'amd64' }
$asset = $releases.assets | Where-Object { $_.name -eq "scrutiny-collector-metrics-windows-$arch.exe" } | Select-Object -First 1
$url = $asset.browser_download_url
$checksum = (Invoke-WebRequest -Uri $url -Method Head -UseBasicParsing | Select-Object -ExpandProperty Headers.'Content-MD5').ToUpper()
$checksumType = 'md5'

# Parse install directory
$packageParameters = $env:ChocolateyPackageParameters
$installDir = if ($packageParameters -match '/InstallDir:(\S+)') { $matches[1] } else { 'C:\opt\scrutiny' }

$packageArgs = @{
    packageName   = $packageName
    url           = $url
    checksum      = $checksum
    checksumType  = $checksumType
    fileFullPath  = "$installDir\$($asset.name)"
}

New-Item -ItemType Directory -Path $installDir -Force
Get-ChocolateyWebFile @packageArgs