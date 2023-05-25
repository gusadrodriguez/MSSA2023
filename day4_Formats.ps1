

Get-Service | 
Where-Object {$_.Name -like 'a*'} | # -like is able to interpret wildcard notations 
 Select-Object -Property Status, DisplayName |
 ConvertTo-Csv|
 Out-File -FilePath e:\services.csv
# this gets all files with a name that begins with "a" and saves into a file that can be used by csv

#you can use HTML to edit the out put of a file using CSS
#Syntax [variable] = @'{} '@

Get-Service -Name S* |
Out-GridView -OutputMode Multiple -Title 'Choose some services to stop' |
Stop-Service -WhatIf #whatif is a stop safe

Get-ADComputer -Filter * | Get-Service -ClassName Win32_service
Get-Help -full Get-CimInstance #-computername [string] -namespace [string] -property [string]
Get-ADComputer -Filter * | Get-Member -MemberType Properties

Get-AdvGet-ADComputer -Filter * | Get-Service -ClassName Win32_service
Get-Help -full Get-CimInstance #-computername [string] -namespace [string] -property [string]
Get-ADComputer -Filter * | Get-Member -MemberType Properties