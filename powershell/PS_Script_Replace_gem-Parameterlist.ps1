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

# Mehrzeiler einfügen - klappt das mit dem Zeilenumbruch?
$multiLiner="Zeile 1
Zeile 2"

$raw=Get-Content -Path .\$outFile -Raw 
$raw.Replace(("Value1:1"), $multiLiner) | Out-File -FilePath $outFile -NoNewline
