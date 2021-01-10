# PowerShell - Generelles

## Nützliche Befehle
Einzelne Befehle, die für die Orientierung in PowerShell nützlich sind:  
|Befehl|Erläuterungen|
|---|---|
|`$PSVersionTable`|Powershell Versions-Infos anzeigen|
|`Alias`|Liste aller definierten Alias-Befehle|
| `Get-Alias -Definition Get-C*`|Alias zu bestimmten Befehlen suchen|
| `Get-Alias -Name gci*`|Bedeutung Alias suchen|
|`Get-PSProvider`|Liste der Provider(Adapter), auf die PS zugreifen kann|
|`Get-PSDrive`|Liste der Provider, auf die PS wie ein Laufwerk zugreifen kann|
|`(gci env:Path).Value`| Path auslesen|
|`Set-Item -Path Env:/NewItem -value 1`|Path-Variable setzen|
|`--%`|Anweisung an Powershell-Parser, NICHTS zu parsen|

Parameter eines cmdlets: `Get-Command get-process | select-object -Expand parameters`  
Details eines Parameters eines cmdlets: `(Get-Command get-process | select-object -Expand parameters).ErrorAction`


## Help System

### Help durchsuchen
Die Syntax für Help ist "Get-Help [-name] <cmdlet-name> ". 
- `Get-Help -name Get-Member`
- `Get-Member -?` - funktioniert nur bei Cmdlets
- `help Get-Member` - zeigt die Hilfe Seitenweise (wie "less") - weiterblättern mit "Leertaste"
- `Get-Help Get-Member -Examples` - Zeigt Hilfe mit Beispielen
- `help Get-Member -Full` - Zeigt Hilfe mit allen Input- und Output-Parameter und Beispielen
- `help Get-Member -Online` - zeigt Hilfe im Standard-Browser (aber nur, wenn Internet-Zugriff besteht)

Wildcard bei der Suche für 0-n Zeichen ist `*`, für EIN Zeichen `?`. Bereiche können mit eckigen Klammern und Minus `[x-z]` abgefragt werden, mehrere bestimmte Zeichen mit eckigen Klammern und den Zeichen (`[bc]ook` findet `book` UND `cook`). Wenn Leerzeichen oder andere Sonderzeichen in Such-Strings sein sollen, muss der komplette String mit EINFACHEN Anführungszeichen umschlossen sein. Beispiel: `-Path '~\Mein Verzeichnis'`

Bei der Suche in Commands kann man mit `Get-Command -name <Input>` und/oder den Optionen -Verb und -Noun gemacht werden. Beispiel mit Command-Alias:`gcm -Verb Set -Noun W*`

### Help Syntax
Wenn mehr als eine Version des Aufrufs da ist, unterscheiden sie sich in mindestens einem Parameter - der jeweils nur in einer Version vorhanden ist. Dieser Parameter bestimmt dann, wie die weiteren Parameter ausgewertet werden.

Generelles zur Darstellung:  
- Parameter haben ein vorangestelltes `-` OHNE Leerzeichen zwischen Minus und Paramter-Namen
- Spitze Klammern kennzeichnen einen `<Input-Wert>`
- Parameter/Inputs OHNE eckiger Klammern sind MUSS-Eingaben
- "Äussere" eckige Klammern `[ -Parametername]` zeigen optionale Parameter/Inputs; eckige Klammern innerhalb eines Inputs kennzeichen ein Array
Beispiel: `[-Path] <String[]>` bedeutet: Parametername ist optional (in eckigen Klammern), aber das Input ist Pflicht (keine eckigen Klammern) - und es können mehrere Werte (getrennt durch Komma) eingegeben werden - wie hier zwei Dateinamen: `gci -Path .\PS-Filesystem-Operationen.md, .\PS-Generelles.md`
- Parameter ohne Wert heißen "Switch" (=Schalter)
- Parameter und deren Werte und Parameter(/Wert-Kombinationen) müssen durch GENAU EIN Leerzeichen getrennt sein
- cmdlets bestehen aus einer Verb-Nomen-Kombination; gültige Verben (und Ihre Bedeutung) können über `Get-Verb` über ermittelt werden

### Help lokal herunterladen
Die aktuellsten Help-Files gibt es auf Englisch - daher am besten mit der entsprechenden Version herunterladen:   
`Update-Help -UICulture en-US`  
Wenn der Computer kein Internet hat - auf einem anderen mit `Save-Help -UICulture en-US` als File herunterladen, das File auf den isolierten Computer bringen und dort mit `Update-Help -Source <File-Path>` einspielen.