# PS - Script Replace gem. Parameterliste in X Files
# PS_Script_Replace_gem-Parameterlist

# notwendige Input-Files definieren
$inputFileParameter='paramsInput.array'
$inputFileTemplate='Lab_Template.csv'
Set-Location ((Get-Childitem $inputFileTemplate -Recurse).DirectoryName)


# Liste Parameter (Key-Value Pairs) aus File in Array einlesen
$raw=Get-Content -Path $inputFileParameter
$raw.Count
$params=(Get-Content -Path $inputFileParameter -tail ($raw.Count -1))
# Template laden und als File unter Ziel-Namen speichern
# alle Keys in File suchen, durch Value ersetzen und im richtigen Format speichern 