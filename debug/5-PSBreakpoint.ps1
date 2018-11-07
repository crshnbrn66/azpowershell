#region Save this script or else no fun!
# line breakpoints work for SAVED SCRIPTS only (because they need a line and a script)
$myPath = $PSCommandPath
if (!$myPath) { Write-Warning 'Save me first!'; return }
#endregion

# set a line breakpoint programmatically or press F9 to toggle
Set-PSBreakpoint -Action { Write-Host 'BP HIT!' -ForegroundColor Red; [Console]::Beep() } -Line 11 -Script $myPath
Set-PSBreakpoint -Action { break } -Line 11 -Script $myPath

Get-PSBreakpoint | Remove-PSBreakpoint

return

Set-PSBreakpoint -Action { Write-Host '$a changed!' -ForegroundColor Red; [Console]::Beep() } -Variable a
Set-PSBreakpoint -Action { if ($a -gt 10) { Write-Host '$a is now greater than 10!' -ForegroundColor Red; [Console]::Beep() } } -Variable a
Set-PSBreakpoint -Action { if ($a -gt 20) { break } } -Variable a
