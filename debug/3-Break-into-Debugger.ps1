#region New in PS5
Wait-Debugger
#endregion

$file = Join-Path -Path $PSScriptRoot -ChildPath payload.txt
$exists = Test-Path -Path $file
if ($exists) { 
   Remove-Item -Path $file 
}

for ($i = 1; $i -lt 10000; $i++)
{ 
    Write-Warning "Processing $i..."
    Start-Sleep -Seconds 1
    Add-Content -Path $file -Value $i    
}
