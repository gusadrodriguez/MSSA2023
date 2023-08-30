
#location of CSV file
$csvFilePath = "E:\NewHires.CSV"

#import & display CSV contents
$csvFile = Import-Csv -path $csvFilePath -Delimiter ","
$csvfile | ft

#get member departments to cross reference with AD OUs
$memberDepts = $csvFile | Select-Object -Property department -Unique
$memberDeptsArray = $memberDepts.department | Sort-Object

#get AD OUs to cross reference with member departments
$currentOrgUnits = Get-ADOrganizationalUnit -filter * | Select-Object -property Name
$currentOrgUnitsArray = $currentOrgUnits.Name

#cross refrenece Member Departments & OUs - if they do not exist then create
foreach ($memberDept in $memberDeptsArray){
  $flag = $false
    foreach ($OU in $currentOrgUnitsArray){
      if($OU -eq $memberDept){
        $flag = $true
        }
      }
   Write-Host $flag
     if ($flag -eq $false){
       New-ADOrganizationalUnit -Name $memberDept
       }
     }

#get Security Groups for cross reference with Member Departments
$secGroups = Get-ADGroup -Filter {name -like "*"} | Select-Object -Property name -unique | Sort-Object
$secGroupsArray = $secGroups.name | Sort-Object
$secGroupsArray

#cross reference Security Groups with Member Departments in their OUs - if they do not exist then create
foreach ($memberDept in $memberDeptsArray){
  $flag = $false
    foreach ($secGroup in $secGroupsArray){
      if($secGroup -eq $memberDept){
        $flag = $true
        }
      }
   Write-Host $flag
     if ($flag -eq $false){
     $groupName = "$memberDept"
     $ouPath = "OU=$memberDept, DC=Adatum, DC=com"
     New-ADGroup -Name $groupName -GroupScope Global -GroupCategory Security -path $ouPath 
       }
     }


#create users in AD from CSV

#add CSV AD users to OUs & Sec Groups

<#--------------------------------------------------------------------------------------------------------------------------------------------------------#>

$removeOUObjects = Get-ADOrganizationalUnit -filter { name -like "@{*"} | Select-Object -Property Name
$removeOUObjectsArray = $removeOUObjects.Name

foreach ($item in $removeOUObjectsArray){
    Get-ADOrganizationalUnit -filter { name -like $item}| Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru| Remove-ADOrganizationalUnit -Confirm:$false
    }

 
 $membersSecurity = $csvFile | Select-Object -Property firstname, lastname, department -Unique | Sort-Object -Property department, firstname

foreach ($member in $membersSecurity){
  Write-host "member name: $($member.Firstname) $($member.LastName) and department: $($member.department)"
  
  Add-ADGroupMember -Identity "OU=$($member.department),DC=Adatum,DC=com" -member ($member.firstname+" "+$member.lastname)
  Add-ADGroupMember -Identity "OU=$($member.department),DC=Adatum,DC=com" -member ($member.firstname+" "+$member.lastname)
  }


$firstName = $member.firstName
$lastName =  $member.lastName

$fullName = $firstname + "_" + $lastname

$name = ($user.firstname + "_" + $user.Lastname)

$charArray = $firstname.toCharArray()
$lowerFirstNameChar = $charArray[0].ToString()
$SAMName = $lowerFirstNameChar.ToLower() + "." + $lastname.toLower()

$fullName
$SAMName



#new-AdUser -name -SamAccountName -city -EmailAddress 

foreach (
$newAdUserParams = @(

"name" = $member.Firstname

)

new-adUser $newAdUserParams
Set-ADAccountPassword -Identity 'CN=$member.name, OU=$member.department, DC=Adatum, DC=com'


$userParam = @{

"Name" = "Bob"
"LastName" = "Dylan"
"Department" = "IT"
"AccountPassword" = "Password1234"
}
