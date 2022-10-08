A faster, better and more stable redis desktop manager [GUI client], compatible with Linux, Windows, Mac. What's more, it won't crash when loading massive keys.

If you want to install on Mac\Linux\Windows, see [https://github.com/qishibo/AnotherRedisDesktopManager](https://github.com/qishibo/AnotherRedisDesktopManager)


sha256 calc in windows

```
certutil -hashfile 'Another-Redis-Desktop-Manager.xxx.exe' SHA256
```

1. download exe from release
1. calc sha256
1. update version in nuspec
1. update checksum, url in install.ps1
1. choco pack
1. choco push another-redis-desktop-manager.1.5.x.nupkg