# PS - Script Replace gem. Parameterliste in X Files
# PS_Script_Replace_gem-Parameterlist

# notwendige Input-Files definieren
$inputFileParameter='params.txt'
$inputFileTemplate='Lab_Template.csv'
$outFile='NewFile.txt'
Set-Location ((Get-Childitem $inputFileTemplate -Recurse).DirectoryName)

# Liste Parameter (Key-Value Pairs) aus File in Hashtable einlesen

$paramsHash=@{}

foreach($item in (Import-Csv $inputFileParameter -Delimiter ";"))
   {
       $paramsHash.Add($($item.key),$($item.value))
   }

# Template laden und als File unter neuem Ziel-Namen speichern
$raw=Get-Content -Path .\$inputFileTemplate -Raw | Out-File -FilePath $outFile -NoNewline

# alle Keys in File suchen, durch Value ersetzen und im richtigen Format speichern 
foreach($item in $paramsHash.PSBase.Keys)
   {
    $raw=Get-Content -Path .\$outFile -Raw 
    $raw.Replace(("###" + $item + "###"), $paramsHash.($item)) | Out-File -FilePath $outFile -NoNewline
}

# Ergebnis kontrollieren
Compare-Object -ReferenceObject (Get-Content $inputFileTemplate) -DifferenceObject (Get-Content $outFile)

######  Variante ############
# Mehrzeiler einfügen - klappt das mit dem Zeilenumbruch?

$inputFileTemplate='Lab_Template.csv'
$outFile='NewFile.txt'

New-Item -Path "M.txt" -ItemType "File"

$raw=Get-Content -Path .\$inputFileTemplate -Raw 
Out-File -InputObject $raw -FilePath $outFile -NoNewline

# alle Keys in File suchen, durch Value ersetzen und im richtigen Format speichern 
foreach($line in gc -Path .\NewFile.txt)
   {
    $out="Input: "+$line | Out-Host
    IF($line -eq "Value1:###PARAM1###")
      {Add-Content -Path M.txt -Value "Zeile A"
      Add-Content -Path M.txt -Value "Zeile B"
      Add-Content -Path M.txt -Value "Zeile C"
    } 
    ELSE {Add-Content -Path M.txt $line}
} 

Get-Content -Path .\M.txt