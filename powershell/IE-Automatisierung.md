# Powershell und IE

```
cls
$loginUrl = "https://www.helmker.de"

#initialize browser
$ie = New-Object -com internetexplorer.application;
$ie.visible = $true;
$ie.navigate($loginUrl);
```

-- Disabling Internet Explorer Security Mode from PowerShel
https://brakertech.com/disabling-internet-explorer-security-mode-from-powershell/