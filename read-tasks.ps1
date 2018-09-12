function New-TaskItem
{
    $x = New-Object Object
    $x | Add-Member -MemberType NoteProperty -Name Name -Value ""
    return $x
}

if (Test-Path .dat) {
    $tasks = @()
    foreach ($line in Get-Content .dat) {
        if ($line[0] -eq "-") {
            if ($x) {
                $tasks += $x
            }
            $x = New-TaskItem
            $x.Name = $line.Substring(2)
        }
    }
    $tasks += $x
    return $tasks
}