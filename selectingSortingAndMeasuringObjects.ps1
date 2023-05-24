Get-Service | Sort-Object -Property Status  #you'll noticed that they're not DESCENDING instead of ASCENDING because its ENUM'd not by STATUS
Get-Service | Sort-Object -Property Status | Get-Member  #you'll noticed that they're not DESCENDING instead of ASCENDING because its ENUM'd not by STATUS

$services = Get-Service
$services.status.value_ # $services is now an object we want to understand, when we use . it allows us to go deeper into the properties of the object

$testDemo = Get-Service # this and the item below seem like they're asking the same thing but are not - when utilizing . you are being EXPLICITLY specific
$testDemo.Name | gm

Get-Service | Select-Object -Property Name | gm
Get-Service | Sort-Object -Property Status, Name #will sort by first status, then name
Get-Service | Sort-Object -Property Status, Name | Format-Table -GroupBy Status # chunks out by parameter type
*** Always  SORT and then FORMAT -Groupby 

$num1 = '11'
$num2 = 12

$num1.GetType()
$num2.GetType()

Get-Process | Measure-Object -Average -Property CPU

Get-ADUser -Filter * -Properties Department | Select-Object -Property Department -Unique
