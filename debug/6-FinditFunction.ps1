function findit
{
    param
    (
    [Parameter(Mandatory=$True,Position=0)][string]$SearchString,
    [Parameter(Mandatory=$False)]$Path = "$env:USERPROFILE\Documents",
    [Parameter(Mandatory=$False)]$Filter = "*.ps1"
    )
    Get-ChildItem -Path $Path -Filter $Filter -Recurse | Select-String $SearchString | select path, @{n="MatchingLines";e={"$($_.LineNumber.tostring("000")): $($_.Line -replace "^[ \t]*",'')"}} | group path | select name, @{n="Matches";e={$_.Group.MatchingLines  | Out-String}} | Out-GridView -PassThru | %{psedit -filenames $_.name}
} 
#;findit -searchstring get-psbreakpoint -path c:\users\crshn\onedrive\debug -filter *.ps1