$csvFilePath = "E:\NewHires.CSV"

$csvFile = Import-Csv -path $csvFilePath -Delimiter ","

$departments = $csvFile | Select-Object -Property department -Unique
$departmentsArray = $departments.department

$orgUnits = Get-ADOrganizationalUnit -filter * | Select-Object -property Name
$orgUnitsArray = $orgUnits.Name

foreach ($department in $departmentsArray){
  $flag = $false
    foreach ($name in $orgUnitsArray){
      if($name -eq $department){
        $flag = $true
        }
      }
   Write-Host $flag
     if ($flag -eq $false){
       New-ADOrganizationalUnit -Name $department
       }
     }

$removeOUObjects = Get-ADOrganizationalUnit -filter { name -like "@{*"} | Select-Object -Property Name
$removeOUObjectsArray = $removeOUObjects.Name

foreach ($item in $removeOUObjectsArray){
    Get-ADOrganizationalUnit -filter { name -like $item}| Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru| Remove-ADOrganizationalUnit -Confirm:$false
    }


#Finish creating missing OUs

#Using the CSV we have to add users into Security Groups related to their Department

<#
For loop through the CSV and take the firstname, lastname, department and save into variable
for the department variable save the firstname,lastname into ADD-ADGroupMember
Get-ADGroupMember from OU's to check if the code was successful
#>

#figure out how to set user account passwords in powershell
