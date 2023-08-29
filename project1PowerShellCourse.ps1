$csvFilePath = "E:\NewHires.CSV"

$csvFile = Import-Csv -path $csvFilePath -Delimiter ","

$departments = $csvFile | Select-Object -Property department
$departmentsArray = $departments.department

$orgUnits = Get-ADOrganizationalUnit -filter * | Select-Object -property Name
$orgUnitsArray = $orgUnits.Name

foreach ($department in $departmentArray){
    foreach($name in $orgUnitsArray){
        if($departmentsArray.department -ne $orgUnitsArray.name){
            New-ADOrganizationalUnit -name $department
        }
    }
}

$removeOUObjects = Get-ADOrganizationalUnit -filter { name -like "@{*"} | Select-Object -Property Name
$removeOUObjectsArray = $removeOUObjects.Name

foreach ($item in $removeOUObjectsArray){
    Get-ADOrganizationalUnit -filter { name -like $item}| Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru| Remove-ADOrganizationalUnit -Confirm:$false
    }

