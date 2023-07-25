#this creates a PSMD file for versioning / version control
New-ModuleManifest -path .\Add_Mult.psd1 -ModuleVersion '1.0.0' -rootModule .\Add_Mult.psm1 -author 'Gustavo Rodriguez' -description "creates math tools" -FunctionsToExport Get-addition, Get-Multiplication
