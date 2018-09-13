$x = New-Object Object
$x | Add-Member -MemberType NoteProperty -Name Name -Value $null
$x | Add-Member -MemberType NoteProperty -Name Id -Value $null
$x | Add-Member -MemberType ScriptMethod { Add-Content .dat "-$($this.Name)"; Add-Content .dat "#Id#$($this.Id)" } -Name "Save"
return $x