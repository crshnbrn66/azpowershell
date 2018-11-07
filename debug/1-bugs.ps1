cd C:\users\crshn\OneDrive\debug
#different types of errors
# Syntax Errors
'This is a syntax error'
#typo that type of thing that powershell will normally catch


# Runtime Errors - these are subject to typical error handling strategies
# i.e. assigning drive letter that is already taken
#this should run fine the first time then doesn't run the second time because already taken will be an error
New-PSDrive -Name G -PSProvider FileSystem -Root \\127.0.0.1\c$ -Persist

# Logical Errors - no PS errors show up don't emit an error
# Script is fine and runs fine but does not do what you want
Test-Path -Path '\\127.0.0.1\c$'
Do-SomethingWeird -Force
Do-SomethingWeird -ToChangeBackToGood
#change to the registry and you get different results
cd hklm:
Test-Path -Path '\\127.0.0.1\c$'
Test-Path -Path 'filesystem::\\127.0.0.1\c$'
 