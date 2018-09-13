param($x)

if (-not(Test-Path .dat)) {
    return
}

$tasks = .\read-tasks.ps1
$newTasks = @()
$found = $false

foreach ($task in $tasks) {
    if ($task.Name -eq $x) {
        $found = $true
    }
    elseif ($task.Id -eq $x) {
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