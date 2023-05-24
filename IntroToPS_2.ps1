Get-Module
Import-Module ActiveDirectory

Get-Command -Module ActiveDirectory
Remove-Module ActiveDirectory

New-ADuser -Name Brent 

$env:PSModulePath

Hello

Get-Module -ListAvailable