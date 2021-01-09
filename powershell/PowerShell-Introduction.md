# PowerShell-Introduction

## Filesystem-Aktionen
`Get-ChildItem | Get-Member`

### Dateien suchen, die in den letzten x/y Tagen geändert wurden
`Get-ChildItem -Path *node*.log -Recurse| ? {$_.LastWriteTime -gt (Get-Date).AddDays(-0.1)}`

 
```
Get-ChildItem -Recurse |   
   Where-Object -Property {LastWriteTime -gt (Get-Date -DisplayHint Date)}| 
   Select-Object Name, LastWriteTime
```

  Get-ChildItem | Sort-Object -Descending -Property LastWriteTime | Select-Object -First 3

  Get-ChildItem | Where-Object {$psitem.LastWriteTime -gt (get-date -1)}
  
# Berechtigungen an einer Datei setzen
#$a1 = Get-Acl .\wc_tag_d_load.log
$CurTgt = ".\wc_tag_d_load.log"
#$CurUsr = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurUsr = "Thomas-Dell\Maya"
$acl = Get-Acl $CurTgt
##$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($CurUsr,"FullControl","ContainerInherit,ObjectInherit","None","Allow")
$AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($CurUsr,"FullControl","None","None","Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl $CurTgt

# Berechtigungen ansehen:    $CurTgt.Access

