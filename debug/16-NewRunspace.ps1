

$code = 
{

   for ($i = 1; $i -lt 10000; $i++)
   { 
      Start-Sleep -Seconds 1
      [Console]::Beep(3000,300)
      Write-Host $i
   }
}

$NewPowerShell = [PowerShell]::Create()
$null = $NewPowerShell.AddScript($code)
$handle = $NewPowerShell.BeginInvoke()
return

# get latest runspace, and debug it:
$lastRunspace = Get-Runspace | Select-Object -Last 1
Debug-Runspace -Runspace $lastRunspace

 
# kill runspace:
$NewPowerShell.Stop()
$NewPowerShell.Runspace.Close()
$NewPowerShell.Dispose()
psedit 'C:\users\thom\OneDrive\Debugging\17 NewRunspace corrected.ps1'