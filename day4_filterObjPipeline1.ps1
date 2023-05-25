Get-Service | Where-Object {$_.Status -eq 'Running'} #finds a specific service IF it cannot be found with the parameters that come initially with the HEAD command

#boolean logic used in PS is AND OR and NOT

Get-Service | Where-Object {
  $_.Status -eq 'Running' -or $_.Name -like "a*"}  #this chooses only running processes OR stopped with names LIKE "a*" 
Get-Service | Where-Object {
  $_.Status -eq 'Running' -or $_.Name -like "a??????*"} #this has a filter using ?  which will only produce texts based off of how  many characters we defined using ? 

#Enumeration
Get-Service | ForEach-Object {
  $_.Name + ' is the name of the service ' 
  $_.Status + ' is the status of ' + $_.Name
  "--------------------------------"
}

#know the difference btween where-Object and select-Object
#ForEach-Object allows us to select an object and apply multiple commands to them

1..10 | ForEach-Object {Get-Random} #produces an array of random numbers 10 times
1..10 | ForEach-Object {Get-Random -SetSeed $_}

#SENDING & PASSING DATA AS OUPUT FROM THE PIPELINE

#PASS PIPELINE OBJECTS
#try byValue first and then byName
Get-Service | Stop-Service -WhatIf

#byVal
Get-Service | Get-Member -MemberType Properties #Type ServiceController
Get-Help -full Stop-Service # has a command with byVal type -inputObject [servicecontroller]

#byPropName
Get-Service | Stop-Process -WhatIf #type ServiceController
Get-Help -full Stop-Process # -id [int] -name [String]
Get-Service | Get-Member -MemberType Properties