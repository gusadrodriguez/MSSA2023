#Day 4

$Array = 350, 8 , 4 

$Car = @{
    Engine = 350
    Cyl = 8
    WheelDrive = 4
}

$Car.Engine

$PrintSpooler = Get-Service -Name Spooler
$PrintSpooler.Status

(Get-Service -Name Spooler).DisplayName.Length #this will return only a single VALUE
Get-Service -Name Spooler | Select-Object -Property Name, Status #this will return a set of properties 

Get-Volume  #Gets Drive specific information for hard-disk memory

Get-Volume | gm
Get-Volume | Select-Object -Property DriveLetter, Size, SizeRemaining, @{n='SizeUsed';e={$_.Size - $_.SizeRemaining}} # the syntax for creating new properties is @(n='[string]';e-$_.[property])

Get-Volume | Select-Object -Property DriveLetter, @{n="PercentDriveUsed";e={($_.Size - $_.SizeRemaining) / $_.Size * 100 }}
Get-Volume | Select-Object -Property DriveLetter, @{n="PercentDriveUsed";e={'{0:P2}' -f (($_.Size - $_.SizeRemaining) / $_.Size * 100 )}} #added 0:p2 which represents in decimal percentages & -f for formating 

$testNumbers = 23.532352352, 45.6223423452, 56.15235235
'{1:n2} {0:n0} {2:c2}' -f $testNumbers #these takes the inputs from the array position to change the format, these are restructured to be in a difference sequence with different value types