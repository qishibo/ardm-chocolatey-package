$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v1.7.2/Another-Redis-Desktop-Manager-win-1.7.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Another Redis Desktop Manager*'

  checksum      = '8d16d47e5fe27ea70343a85040c7f63b744e497f133b93813f7611eeaa4558b1'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
