# Manning labs - Format-Table Beispiele
2. Display a table of processes that includes the process names and IDs. Also include columns for virtual and physical memory usage, expressing those values in megabytes (MB).
Get-Process | 
  Select-Object -First 10 |
  Format-Table  Name, Id, 
                @{name="VirtualMB"; expression={$_.VirtualMemorySize / 1MB -as [int]} },
                @{name="PhysicalMB)"; expression={$_.workingset / 1MB -as [int]}}
3. Use Get-Module to get a list of loaded modules. Format the output as a table that , in this order, the module name and the version. The column headers must be ModuleName and ModuleVersion
```
Get-Module |
  Format-Table -property @{name="ModuleName";expression={$_.Name}}, 
               @{name="ModuleVersion";expression={$_.Version}}
```
4.  Format-Table: Gruppiert
```
Get-Service | select -first 10 | 
  Where-Object name -match "Antivir"|Format-Table -Property Name, DisplayName -AutoSize -GroupBy Status
```
5. Format-Wide: EIN Attribut in 4 Spalten
```
gci ~ -Directory | Format-Wide -column 4
```