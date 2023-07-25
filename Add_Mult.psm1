<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
    Created By:
    Change Log:
    Date       Version      What Was Changed
    ----       -------      ----------------
    24/Jul/2023 1.0.0        Script created
    24/Jul/2023 1.0.1        Added Division
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
.PARAMETER Num1
    variable for the first int
.PARAMETER Num2
    variable for the second int
#>


function Get-Addition {
<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
    Created By:
    Change Log:
    Date       Version      What Was Changed
    ----       -------      ----------------
    24/Jul/2023 1.0.0        Script created
    24/Jul/2023 1.0.1        Added Division
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
.PARAMETER Num1
    variable for the first int
.PARAMETER Num2
    variable for the second int
#>
[cmdletbinding()]
    Param(
      $num1,
      $num2
    )
    $resultObj = [PSCustomObject]@{
    Num1 = $num1
    Num2 = $num2
    Result = $num1+$num2
    }

    return $resultObj
}

function Get-Multiplication {
[cmdletbinding()]
    Param(
      $num1,
      $num2
    )
    $resultObj = [PSCustomObject]@{
    Num1 = $num1
    Num2 = $num2
    Result = $num1*$num2
    }

    return $resultObj
}


function Get-Division {
[cmdletbinding()]
   Param(
      $num1,
      $num2
    )
    $resultObj = [PSCustomObject]@{
    Num1 = $num1
    Num2 = $num2
    Result = $num1%$num2
    }

    return $resultObj
}


#****to return multiple variables use hashtable example****
# $addHash = @ { Num1 = $num1, Num2 = $num2, Result = $Num1 + $Num}
# $resultObj = New-Object -TypeName PSObject -property $addHash
# return $resultObj

#... you can also use $resultObj = [PSCustomObject]@{    for the hashtable <----- i prefer this way

#to call these values in prompt you can say (get-addition -Num1 123 -Num2 564).Num2
#or call the items using pipe
#get-addition -Num1 342 -Num2 546 | Select-Object num1, result