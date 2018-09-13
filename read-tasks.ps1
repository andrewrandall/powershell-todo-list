if (Test-Path .dat) {
    $tasks = @()
    foreach ($line in Get-Content .dat) {
        if ($line[0] -eq "-") {
            if ($x) {
                $tasks += $x
            }
            $x = .\new-taskitem.ps1
            $x.Name = $line.Substring(1)
        }
        elseif ($line.Substring(0, 4) -eq "#Id#") {
            $x.Id = $line.Substring(4)
        }
    }
    $tasks += $x
    return $tasks
}