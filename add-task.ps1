param($name)

$ErrorActionPreference = "Stop"

if (-not (Test-Path .dat)) {
    .\init.ps1
}

$tasks = .\read-tasks.ps1
foreach ($task in $tasks) {
    if ($task.Name -eq $name) {
        Write-Host "Task already exists"
        return
    }
}

$taskItem = .\new-taskitem.ps1
$taskItem.Name = $name
$taskItem.Id = ($tasks | Measure-Object -Property Id -Maximum | Select-Object -ExpandProperty Maximum) + 1
$taskItem.Save()