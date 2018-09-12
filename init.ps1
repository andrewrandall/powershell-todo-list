function Create-File
{
	if (-not (Test-Path .dat)) {
		New-Item .dat | Out-Null
	}
}

Create-File