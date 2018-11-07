

# Variable breakpoints do not require a script
# however this is dangerous. The BP may trigger unexpectedly
# for example, when providing intellisense!

$action  = 
{
   Write-Host 'BP hit!' -ForegroundColor Yellow
}

Set-PSBreakpoint -Action $action -Variable i -Mode ReadWrite

return

#region dangerous example
# do NOT do this in the presentation ISE, dude!
# open another fresh ISE because it might break!
$action  = 
{
   Write-Host 'BP hit!' -ForegroundColor Yellow
}
Set-PSBreakpoint -Action $action -Variable _ -Mode ReadWrite
Set-PSBreakpoint -Variable _ -Mode ReadWrite

Get-ChildItem -Path c:\windows
Get-PSBreakpoint | Remove-PSBreakpoint
#endregion