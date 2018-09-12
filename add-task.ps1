param($name)

if (-not (Test-Path .dat)) {
    .\init.ps1
}

foreach ($line in Get-Content .dat) {
    if ($line[0] -eq "-") {
        $otherTaskName = $line.Substring(2)
        if ($name -eq $otherTaskName) {
            Write-Host "Task already exists"
            return
        }
    }
}

Add-Content .dat "- $($name)"
.\list-tasks.ps1