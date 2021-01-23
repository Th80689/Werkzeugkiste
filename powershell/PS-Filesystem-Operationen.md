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
|gci|`Get-ChildItem -name`|Zeige nur den Namen der Unterelemente|
|ri|`Remove-Item wc_tag_d_load.log`|Datei löschen|
||`Remove-Item testdir -Recurse -Confirm`|Verzeichnis - mit allen Unterelementen nach Bestätigung löschen|
|-|-|-|
### Alle Objekte, die innerhalb der letzten X Tage geändert wurden
```
$Zeit=1/2 #Anzahl Tage in die Vergangenheit
$LastChange=(Get-Date).AddDays(-$Zeit) #Zeitpunkt Jetzt - Zeit
Get-ChildItem -Path * -Recurse| Where-Object {$_.LastWriteTime -gt $LastChange}
```
### mögliche Rechtetypen in ACLs anzeigen
`[system.enum]::getnames([System.Security.AccessControl.FileSystemRights])`

## Zugriffsrechte ändern
```
# Objekt zur Änderung definieren
$tgt='C:\Users\Thomas\datasciencecoursera\GIT.docx'
$acl = Get-Acl $tgt

# Ergebnis anschauen
$acl| fl

# Neue Regel für User, Zugriffsstufe, FileSystem-Rechte definieren
## User definieren
$tgtUsr=$env:COMPUTERNAME+'\Users'  

$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($tgtUsr,"FullControl","Allow")

# Neue Regel in der AccessControlList im Speicher festlegen
$acl.SetAccessRule($AccessRule)

# Regel in der acl im Filesystem persistieren
$acl | Set-Acl $tgt

# Ergebnis anschauen
$acl| fl
```