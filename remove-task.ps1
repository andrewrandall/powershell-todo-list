param($name)

if (-not(Test-Path .dat)) {
    return
}

Move-Item .dat .datbak

foreach ($line in Get-Content .datbak) {
    if ($line.Substring(2) -ne $name) {
        Add-Content .dat $line
    }
}

Remove-Item .datbak

.\list-tasks.ps1 -supressNoTaskWarning $true