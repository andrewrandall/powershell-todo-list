param($supressNoTaskWarning=$false)

$tasks = .\read-tasks.ps1

if (($tasks.Length -eq 0) -and ($supressNoTaskWarning -eq $false)) {
    Write-Host "No tasks added yet"
}
else {
    foreach ($task in $tasks) {
        Write-Host $task.Name
    }
}