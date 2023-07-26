Invoke-Command -ComputerName lon-svr1 -ScriptBlock {
Get-WindowsFeature}

Invoke-Command -ComputerName lon-svr1 -ScriptBlock {
Get-WindowsFeature | 
Select-Object Name, InstallState
}

#checked to see if we had certain features installed on the SVR
Invoke-Command -ComputerName lon-svr1 -ScriptBlock {
Get-WindowsFeature
} |
Select-Object Name, InstallState 

#we then used invoke to install the Web-Server feature on the server
Invoke-Command -ComputerName lon-svr1 -ScriptBlock {
    Install-WindowsFeature -name 'Web-Server'
    }

#we created a DC specific session & ran PREFIXED commands to get SMBShare information FROM THE DC
$DC1Session = New-PSSession -ComputerName lon-dc1 
import-module -Prefix DC1 -Name SMBShare -PSSession $DC1Session 
Get-DC1SmbShare


