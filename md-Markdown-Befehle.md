# md Basic Syntax



## Gliederung
|Typ|Code|Ergebnis|
|---------------|--------------------------|----------------------------|
|Überschrift 1|`#`||
|Überschrift 2|`##`||
|Überschrift 3|`###`||
|Überschrift 4|`####`||
|Überschrift 5|`#####`||


## Listen und Tabellen
|Typ|Code|Ergebnis|
|---------------|--------------------------|----------------------------|
|Tabelle: Zeile|&#124;Spalte1&#124;Spalte2&#124;Spalte3&#124;||
|Tabelle: Kopf-Trenner|&#124;-----&#124;-----&#124;-----&#124;||
|Tabelle: Spalten-Trenner |`&#124;`|&#124;|

## Listen
### sortierte Liste
```
1. Erster Eintrag
2. Zweiter Eintrag
```  
1. Erster Eintrag
2. Zweiter Eintrag

### unsortierte Liste
```
- Erster Eintrag
- Zweiter Eintrag
```  
- Erster Eintrag
- Zweiter Eintrag

### Aufgaben / Checkbox
```
- [x] erste Aufgabe
- [ ] zweite Aufgabe
```
ergibt
- [x] erste Aufgabe
- [ ] zweite Aufgabe

## Formatierung im Text
|Typ|Code|Ergebnis|
|---------------|--------------------------|----------------------------|
|Codeblock|\`Input\`| `Input`|
|Fett|`**FETT**`|**FETT**|
|durchgestrichen|`~~falsch~~`|~~falsch~~|
|Kursiv|`_kursivierter Text_`|_kursivierter Text_|
|Web-Link|`<https://www.helmker.de>`|<https://www.helmker.de>|
|Bilder|`![Alternativ-Text](images/Werkzeugkiste_Logo_klein.jpg "Tooltip-Text")`|![Alternativ-Text](images/Werkzeugkiste_Logo_klein.jpg "Werkzeugkasten")|
|(ungültige) Bildreferenz|`![Alternativ-Text](images/kein_bild.jpg)`|![Alternativ-Text](images/kein_bild.jpg)|

## Sonderzeichen
|Typ|Code|Ergebnis|
|---------------|--------------------------|----------------------------|
|Escape: |`\_nicht-kursiv_`|\_nicht-kursiv_|

## Zitate
`> Das ist ein Zitat`  
> Das ist ein Zitat
`>> Das ist ein eingerücktes Zitat`
>> Das ist ein eingerücktes Zitat
```> Das ist ein
> mehrzeiliges
> Zitat```  
> Das ist ein
> mehrzeiliges
> Zitat  

## Fenced Code 
\`\`\`{  
 "Vorname":"Thomas",  
 "Nachname":"Helmker",  
 "Ort":"München"  
 }\`\`\`  
```
{  
  "Vorname":"Thomas",  
  "Nachname":"Helmker",  
  "Ort":"München"
}
```

