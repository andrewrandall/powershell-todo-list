param($supressNoTaskWarning=$false)
$any = $false

if (Test-Path .dat) {
    foreach ($line in Get-Content .dat) {
        $any = $true
        Write-Host $line.Substring(2)
    }
}

if (($any -eq $false) -and ($supressNoTaskWarning -eq $false)) {
    Write-Host "No tasks added yet"
}