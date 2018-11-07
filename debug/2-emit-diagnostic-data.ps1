#region use this to enable common parameters for your script
[CmdletBinding()]
param()


<#
      Either call the script with the common parameter -Debug
      Or set $DebugPreference to the desired debugging mode:

      $DebugPreference = 'Continue'          # show debug messages but do not stop
      $DebugPreference = 'Stop'              # immediately abort after first message 
      $DebugPreference = 'Inquire'           # ask what to do (this is default for -Debug)
      $DebugPreference = 'SilentlyContinue'  # hide messages (default)
#>
# help about_Preference_Variables -showwindow

trap
{
   # here is my error handler
   Write-Debug "Error encountered: $_"
   $global:lastError = $_
}
#endregion


$file = Join-Path -Path $PSScriptRoot -ChildPath payload.txt
$exists = Test-Path -Path $file
if ($exists) { 
   Write-Debug 'old output file found, removing...'
   Remove-Item -Path $file 
   Write-Debug 'removed.'
}

Write-Debug 'starting loop...'
for ($i = 1; $i -lt 10000; $i++)
{ 
    Write-Debug "Processing $i..."
    Start-Sleep -Seconds 1
    # some error
    #1/0
    Add-Content -Path $file -Value $i    
}
Write-Debug 'loop finished.'
Write-Host 'Done.'
return
