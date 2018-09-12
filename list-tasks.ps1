if (Test-Path .dat) {
    foreach ($line in Get-Content .dat) {
        Write-Host $line.Substring(2)
    }
}