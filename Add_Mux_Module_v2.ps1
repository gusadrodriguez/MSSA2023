
function Get-Addition {
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