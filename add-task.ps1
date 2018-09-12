param($name)

if (-not (Test-Path .dat)) {
    .\init.ps1
}

Add-Content .dat "- $($name)"