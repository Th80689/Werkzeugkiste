# PowerShell - Filesystem-Operationen

## Generelles
|Befehl/Kürzel|Beschreibung|
|-|-|
|`~`|Abkürzung für "Home"|
|`.\`|Abkürzung für aktuelles Verzeichnis|

## Filesystem-Operationen
|Kürzel|Befehl|Beschreibung|
|-|-|-|
|sl|`Set-Location 'C:\Users\Thomas\'`|Arbeitsverzeichnis wechseln|
|gl|`Get-Location`|Aktuelles Arbeitsverzeichnis anzeigen|
|ni|`New-Item -ItemType Directory -Path testdir`|Neues Verzeichnis anlegen|
||`New-Item -ItemType File -Path testdir\file1.txt`|Neue Datei anlegen|
|gi|`Get-Item .`|Zeige die Eigenschaften des aktuellen Verzeichnisses|
||`Get-Item *`|Zeige alles (normal sichtbare) im aktuellen Verzeichnis|
|gci, ls|`Get-ChildItem ~`|Zeige alles (normal sichtbare) im HOME-Verzeichnis|
||`Get-ChildItem ~\.* -Force`|Zeige alles (auch versteckte Dateien (= `.`)) im HOME-Verzeichnis|
|ri|`Remove-Item wc_tag_d_load.log`|Datei löschen|
||`Remove-Item testdir -Recurse -Confirm`|Verzeichnis - mit allen Unterelementen nach Bestätigung löschen|
|-|-|
## Zugriffsrechte ändern