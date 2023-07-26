#one to one mapping
#starts a remote session on a single machine 
Enter-PSSession -ComputerName Lon-svr1

#ends session
Exit-PSSession

#One to Many types of commands using remoting
Invoke-Command -ComputerName Lon-DC1,Lon-Svr1 -ScriptBlock {Get-Service -Name Spooler}

Invoke-Command -ComputerName lon-dc1 -ScriptBlock {Get-Service -Name Spooler} | gm]

#Persistent Connections

$Sessions = New-PSSession -ComputerName Lon-Dc1, Lon-Svr1

#check the session for details
$sessions

#Using commands with the session variable
Invoke-Command -ScriptBlock {hostname} -Session $Sessions
Invoke-Command -ScriptBlock {Get-Service * | Where-Object {$_ -like 'R*'}} -Session $Sessions


$DC = New-PSSession -ComputerName lon-dc1
Import-Module NetSecurity
Get-Command -Module NetSecurity
#you can import module of a session to use their tools
Import-Module -Prefix DC -Name Netsecurity -PSSession $DC
#this implicitly invokes the command on the DC that we established a connection on
Get-DCNetFireWallRule | Select-Object -first 3 -Property Name, PSComputerName
#This does the rule on the local host
Get-NetFireWallRule | Select-Object -first 3 -Property Name, PSComputerName
