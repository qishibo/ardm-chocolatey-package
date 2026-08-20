$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v1.7.4/Another-Redis-Desktop-Manager-win-1.7.4.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Another Redis Desktop Manager*'

  checksum      = '28af6a9756b93a59cbd71ee9120351ad7cc1280e48e57832fe10013f6d9784ce'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
