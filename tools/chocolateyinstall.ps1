$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v1.6.0/Another-Redis-Desktop-Manager.1.6.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Another Redis Desktop Manager*'

  checksum      = '5b78e8ac533f1888dd881c17cd158bb71455418ac96df0d2696c151a3fc0b757'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs