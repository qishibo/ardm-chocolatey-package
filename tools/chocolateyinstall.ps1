$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v1.5.7/Another-Redis-Desktop-Manager.1.5.7.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Another Redis Desktop Manager*'

  checksum      = '99e3dfb5338435e5ab6453698fbb7e474ad40136744c8a4757010353fe10b483'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs