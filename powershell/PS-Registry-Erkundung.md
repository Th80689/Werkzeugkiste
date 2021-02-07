# PS: Registry-Einträge durchsuchen und finden


https://adamtheautomator.com/powershell-get-registry-value/

## Registry-Einträge suchen

Mit dem Befehl `Get-PSDrive` sieht man unter den Providern sowohl HKCU (HKEY_CURRENT_USER) als auch HKLM (HKEY_LOCAL_MACHINE).

Get-ChildItem -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\' -Name

## Registry-Einträge neu Erzeugen
