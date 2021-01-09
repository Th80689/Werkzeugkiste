# PowerShell - Generelles


## Nützliche Befehle
Einzelne Befehle, die für die Orientierung in PowerShell nützlich sind:  
|Befehl|Erläuterungen|
|---|---|
|`$PSVersionTable`|Powershell Versions-Infos anzeigen|


## Help System

### Help durchsuchen
Die Syntax für Help ist "Get-Help [-name] <cmdlet-name> ". 
- `Get-Help -name Get-Member`
- `Get-Member -?` - funktioniert nur bei Cmdlets
- `help Get-Member` - zeigt die Hilfe Seitenweise (wie "less") - weiterblättern mit "Leertaste"
- `Get-Help Get-Member -Examples` - Zeigt Hilfe mit Beispielen
- `help Get-Member -Full` - Zeigt Hilfe mit allen Input- und Output-Parameter und Beispielen

Wildcard bei der Suche ist `*`. 

Bei der Suche in Commands kann man mit `Get-Command -name <Input>` und/oder den Optionen -Verb und -Noun gemacht werden. Beispiel mit Command-Alias:`gcm -Verb Set -Noun W*`

### Help Syntax
Wenn mehr als eine Version des Aufrufs da ist, unterscheiden sie sich in mindestens einem Parameter - der jeweils nur in einer Version vorhanden ist. Dieser Parameter bestimmt dann, wie die weiteren Parameter ausgewertet werden.

Generelles zur Darstellung:  
- Parameter haben ein vorangestelltes `-`
- Spitze Klammern kennzeichnen einen `<Input-Wert>`
- Parameter/Inputs OHNE eckiger Klammern sind MUSS-Eingaben
- Eckige Klammern `[ -Parametername]` zeigen optionale Parameter/Inputs


### Help lokal herunterladen
Die aktuellsten Help-Files gibt es auf Englisch - daher am besten mit der entsprechenden Version herunterladen:   
`Update-Help -UICulture en-US`  
Wenn der Computer kein Internet hat - auf einem anderen mit `Save-Help -UICulture en-US` als File herunterladen, das File auf den isolierten Computer bringen und dort mit `Update-Help -Source <File-Path>` einspielen.