try {Get-ChildItem e:\dog.txt -ErrorAction Stop}
catch {System.Management.Automation.ErrorRecord} {File Not Found}
catch {"another error happened"}