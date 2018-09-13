param($name)

if (-not(Test-Path .dat)) {
    return
}

$tasks = .\read-tasks.ps1
$newTasks = @()
$found = $false

foreach ($task in $tasks) {
    if ($task.Name -eq $name) {
        $found = $true
    }
    else {
        $newTasks += $task
    }
}

if ($found) {
    .\reset.ps1
    foreach ($task in $newTasks) {
        $task.Save()
    }
}
else {
    Write-Host "Task not found"
}