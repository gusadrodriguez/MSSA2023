Get-Service | Where-Object {$_.Status -eq 'Running'} #finds a specific service IF it cannot be found with the parameters that come initially with the HEAD command

#boolean logic used in PS is AND OR and NOT

Get-Service | Where-Object {$_.Status -eq 'Running' -or $_.Name -like "a*"}  #this chooses only running processes OR stopped with names LIKE "a*" 
Get-Service | Where-Object {$_.Status -eq 'Running' -or $_.Name -like "a??????*"} #this has a filter using ?  which will only produce texts based off of how  many characters we defined using ? 
