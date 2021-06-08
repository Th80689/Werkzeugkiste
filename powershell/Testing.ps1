Get-ChildItem -Attributes !Directory

# Benutzereingabe anfordern mit -Prompt und mit Read-Host in Variable einlesen
# mit doppeltem Anführungszeichen arbeiten, damit Variable gezogen werden
$name = Read-Host -Prompt "Please enter younr name"
Write-Output "Congrattulations $name! You have writte code."

# Profil erstellen
Add-Content -Path $Profile.CurrentUserCurrentHost -Value 'Write-Host "Hello Thomas, welcome back" -foregroundcolor Green ' 

# Aufruf-Parameter für eine Skript deklarieren
## Pflichteingaben: Parameter-Decorator
$val = '# CreateFile.ps1
Param (
  [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
  [string]$Path
)
New-Item $Path # Creates a new file at $Path.
Write-Host "File $Path was created"'

Remove-Item -Path CreateFile.ps1
Add-Content -Path CreateFile.ps1 -Value $val


## Aufruf-Beispiele
./CreateFile.ps1 -Path './newfile.txt' # File ./newfile.txt was created.
./CreateFile.ps1 -Path './anotherfile.txt' # File ./anotherfile.txt was created.

## Fehler werfen mit "Throw"
If (-Not (Test-Path $Path)) 
{
  Throw "The source directory $Path does not exist, please specify an existing directory"
}

aram(
  [string]$Path = './app',
  [string]$DestinationPath = './'
)
if (-Not (Test-Path $Path))
{
  Throw "Der Pfad $Path existiert nicht"
}
$date= Get-Date -format "yyyy-MM-dd"
$DestinationFile = "$($DestinationPath + 'backup-' + $date).zip"

If ( -Not (Test-Path $DestinationFile))
{
Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath ($DestinationPath+$DestinationFile) 
Write-Host "Created backup at $('./backup-' + $date).zip"
} Else {
  Write-Error "Backup-File schon vorhanden"
}

# Errorhandling - mit Fehlermeldungen
Try {
    # Do something with a file.
  } Catch [System.IO.IOException] {
    Write-Host "Something IO went wrong: $($_.error.message)"
  }  Catch {
    Write-Host "Something else went wrong: $($_.error.message)"
  } Finally {
    # Clean up resources.
 }

 ## Fehler werfen - mit ErrorAction "Stop" können Nicht-stoppendende Fehler "Catch-relevant" werden
 Try {
    Get-Content './file.txt' -ErrorAction Stop
 } Catch {
    Write-Host "File can't be found"
 }

 get-process oracle |  select-object -Property ProcessName -ExpandProperty ProcessName, CommandLine | Format-Table

$oraProcs = @(oracle, tnslsnr, omtsreco)

 get-process oracle, tnslsnr, omtsreco   |  select-object -Property Id,  ProcessName, CommandLine, Path  |Format-Table -Autosize



 Get-Process | Where-Object {($_.ProcessName -eq 'oracle') -or ($_.CommandLine -like '*dbhomexe*') }

 Get-Process | Where-Object {$_.CommandLine -like '*dbhomexe*' }
 # objekte mit bestimmtem CommandLine-Aufruf
 get-process | Where-Object -Property CommandLine -eq '"C:\WINDOWS\system32\wwahost.exe" -ServerName:App.wwa'

