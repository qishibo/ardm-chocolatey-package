$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v1.6.7/Another-Redis-Desktop-Manager.1.6.7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Another Redis Desktop Manager*'

  checksum      = 'c3727f6a5f257654b411e420e0287dcc29ceee28b56b90a25c200b5426c2b449'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs