Get-Process -Name r* |  Format-List
Get-Process | Format-Table
Get-Process | Format-Wide -Property Name -Column 4 # ... truncates data
Get-Process | Format-Wide -Property Name -AutoSize #without truncation of data
Get-Process | Get-Member
Get-Process | Format-Table | Get-Member #this is bad etiqutte ...Format types should come at the END of your code(s)