# PS - Script Replace gem. Parameterliste in X Files
# PS_Script_Replace_gem-Parameterlist

# notwendige Input-Files definieren
$inputFileParameter='Lab_Parameter_fuer_Template.csv'
$inputFileTemplate='Lab_Template.csv'
Set-Location ((Get-Childitem $inputFileTemplate -Recurse).DirectoryName)

# Liste Parameter (Key-Value Pairs) aus File in Array einlesen
$params=(Import-Csv -Path $inputFileParameter)
# Template laden und als File unter Ziel-Namen speichern
# alle Keys in File suchen, durch Value ersetzen und im richtigen Format speichern 