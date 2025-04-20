$ErrorActionPreference = 'Stop'

$packageName = 'scrutiny'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = 'C:\opt\scrutiny'

$pp = Get-PackageParameters
if ($pp['InstallDir']) { $installDir = $pp['InstallDir'] }

$url64 = 'https://github.com/AnalogJ/scrutiny/releases/latest/download/scrutiny-collector-windows-amd64.exe'
$urlArm64 = 'https://github.com/AnalogJ/scrutiny/releases/latest/download/scrutiny-collector-windows-arm64.exe'

$cpuInfo = Get-WmiObject -Class Win32_Processor
$arch = if ($cpuInfo.Architecture -eq 12) { 'arm64' } else { 'amd64' }
$url = if ($arch -eq 'arm64') { $urlArm64 } else { $url64 }

$checksum64 = '' # Add checksum if available
$checksumArm64 = '' # Add checksum if available
$checksum = if ($arch -eq 'arm64') { $checksumArm64 } else { $checksum64 }

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  softwareName  = 'Scrutiny Collector*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs    = ''
  validExitCodes= @(0)
}

New-Item -ItemType Directory -Path $installDir -Force
Install-ChocolateyPackage @packageArgs

$exePath = Join-Path $installDir 'scrutiny-collector.exe'
Move-Item -Path (Join-Path $toolsDir 'scrutiny-collector-windows-*.exe') -Destination $exePath -Force