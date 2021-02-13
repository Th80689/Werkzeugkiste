# PS: Registry-Einträge durchsuchen und finden


https://adamtheautomator.com/powershell-get-registry-value/

## Registry-Einträge suchen

Mit dem Befehl `Get-PSDrive` sieht man unter den Providern sowohl HKCU (HKEY_CURRENT_USER) als auch HKLM (HKEY_LOCAL_MACHINE).

`Get-ChildItem -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\' -Name`

`Get-Childitem -Path HKLM:\ -recurse -ErrorAction SilentlyContinue | Where-Object {$_.Name -like "*autorun*"}`


gci -path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' | Select-Object -First 1 | Where-Object {$_.Property -match "DisplayVersion"}

## Registry-Einträge neu Erzeugen
Danke an Dr Scripto: `https://devblogs.microsoft.com/scripting/update-or-add-registry-key-value-with-powershell/`  
Man braucht 3 Variablen (hier: auf Computer, nicht nur für User)  
```
$registryPath = "HKLM:\Software\Testing\Scripts"

$Name = "Version"

$value = "1"

# Registry-Eintrag anlegen - nur wenn er noch nicht da ist
IF(!(Test-Path $registryPath))
  {
    New-Item -Path $registryPath -Force | Out-Null
    #  
    New-ItemProperty -Path $registryPath -Name $name -Value $value `
    -PropertyType DWORD -Force | Out-Null}
 ELSE {
    New-ItemProperty -Path $registryPath -Name $name -Value $value `
    -PropertyType DWORD -Force | Out-Null}

# Prüfen, ob Wert gesetzt ist:
(Get-ItemProperty -Path $registryPath -Name version).version

# Wert ändern
$valueNew = "2"
Set-ItemProperty -Path $registryPath -Name version -Value $valueNew

#
```

## Applikationen deinstallieren

Uninstall-Package -Name "Java SE Development Kit 7 Update 25 (64-bit)"
