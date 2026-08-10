import-module chocolatey-au

function global:au_GetLatest {
    $tag = $env:PACKAGE_VERSION
    if ([string]::IsNullOrWhiteSpace($tag)) {
        throw 'PACKAGE_VERSION environment variable is required (e.g. v1.6.8).'
    }

    $tag = $tag.Trim()
    if ($tag -notmatch '^v(\d+\.\d+\.\d+(?:[.-].+)?)$') {
        throw "Invalid PACKAGE_VERSION '$tag'. Expected format like v1.6.8"
    }

    $version = $Matches[1]
    $url = "https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/$tag/Another-Redis-Desktop-Manager.$version.exe"

    @{
        Version = $version
        URL32   = $url
    }
}

function global:au_SearchReplace {
    @{
        '.\tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

# 1. Download exe from GitHub release
# 2. Calculate sha256 (Checksum32)
# 3. Update nuspec <version>
# 4. Update chocolateyinstall.ps1 url + checksum
update -ChecksumFor 32
