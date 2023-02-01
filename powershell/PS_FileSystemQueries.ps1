# https://www.improvescripting.com/get-folder-size-and-file-count-using-powershell-examples

$catalog="C:\Users\Thomas\github-repos\Werkzeugkiste";

Get-ChildItem -path $catalog -Directory -Recurse | 
Select-Object FullName | 
ForEach-Object -Process{New-Object -TypeName PSObject -Property @{Name=$_.FullName;Size = (Get-ChildItem -path $_.FullName -Recurse -Force -ErrorAction SilentlyContinue | 
Measure-Object -Property Length -Sum ).Sum/1kb}} | 
Select-Object Name, @{Name="Size(KB)";Expression={("{0:N2}" -f($_.Size))}}, Size|
Sort-Object -Property Size -Descending