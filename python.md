# Python - Cheatsheet

Kommentare werden mit dem # eingeführt: ```# Kommentar```.  
Ausgaben: ```print(<input>)```     
Infos: ```help(<function>)```  
## Variablen-Konventionen
MUSS: EIN Wort - keine Leerzeichen.   
Es gibt zwei Varianten: ```snake_case``` - alles klein, getrennt durch Unterstrich ODER ```CamelCase```: keine Leerzeichen, Beginn eines Wortes wird durch Großbuchstaben gekennzeichnet

## Operatoren
|Typ|Operator|Beschreibung|Ergebnis|
|-|-|-|-|
|Arithmetic|+|Addition|Summe|
|Arithmetic|-|Subtraktion||
|Arithmetic|*|Multiplikation|Produkt|
|Arithmetic|/|Division||
|Arithmetic|**|Exponential||
|Arithmetic|%|Modulo|Rest nach Division|
|Vergleiche|==|Gleichheit|True/False|
|Vergleiche|!=|Ungleichheit|True/False|
|Vergleiche|>=|größer oder gleich|True/False|
|Vergleiche|>|größer|True/False|
|Vergleiche|<=|kleiner oder gleich|True/False|
|Vergleiche|<|kleiner|True/False|
|logisch|[not]in||True/False|
|logisch|and||True/False|
|logisch|or||True/False|

## Datentypen
Python ermittelt Datentypen anhand der Eingabe. Sie müssen nicht vorab definiert werden.Datentypen kann man mit ```type(<input>)``` abfragen. Ergebnis ist die Klasse, der Python sie zugeordnet hat; Beispiel ```<class 'int'>.
|Typ|Kürzel|Beispiel|Kommentar|
|-|-|-|-|
|Ganzzahl|```int```|4||
|Decimal|```float```|5.25||
|Zeichenkette, String|```str```|'a'|kann sowohl mit einfachem ' als auch doppelten " definiert werden|
|Bool|```bool```|```True``` oder ```False```|Werte MÜSSEN mit Großbuchstaben beginnen!|

## Arbeiten mit Strings

Multi-Zeilen-Eingabe beginnt und endet im drei doppelten Anführungszeichen ```"""```.

|Methode|Input|Ergebnis|Kommentar|
|-|-|-|-|
|x.replace(s1,s2)|'Alles A'|input.replace('A','B')|'Blles B'|
|x.lower()|'Aber Hallo'|input.lower()|'aber hallo'|
|x.upper()|'Aber Hallo'|input.upper()|'ABER HALLO'|
|||||

## Lists
Lists werden mit eckigen Klammern definiert - die einzelnen Elemente durch Komma getrennt. Die Elemente sind gem. Eingabe geordnet. Anhand ihrer Position (=Index) kann man auf sie zugreifen. WICHTIG: 1. Position ist die 0 (Zero-based indexing). Das letzte Element kann man mit dem Index ```list[-1]``` erreichen. Subsetting: die Elemente e1 bis en können mit ```list[<e1>:<e(n+1>)]``` ermittelt werden (n+1, weil das n+1-Element NICHT mit ausgegeben wird). Vom ersten bis n-ten Element: ```list[:(n+1)]```, ab dem n-ten bis zum Ende: ```list[n+1:]```. Mit doppeltem Doppelpunkt kann jedes n-te Element extrahieren - hier: jedes zweite ```list[::2]``` oder hier: jedes Dritte, starten an Position 2 ```list[1::3]```.  
### List-Methoden
list.append(<val>)

## Dictionaries / Maps
Ein Dictionary ist eine Sammlung von Key-Value-Paaren. Es wird mit geschweiften Klammern, Doppelpunkten und Kommas definiert. Beispiel: ```d={"Key1":"Wert 1", "Key2": Wert 2"}```. Auf die Werte kann man mit dem Key dann wieder zugreifen: z.B. mit ```d["Key1"]``` bekommt man ```"Wert 1"```. Alle Werte (ohne Keys) bekommt man mit ```d.values()```, die Schlüssel mit ```d.keys()```. Mit ```d.items()``` bekommt man das komplette Dictionary in der Form ```dict_items([('Key1','Wert1'),()'Key2','Wert2')])```. Neue Werte kann man mit ```d["Key3"]="Wert3"``` hinzufügen - bzw. einen bestehendes Wertepaar zum Key aktualisieren.
### Sets
Sets enthalten
- können nur EINDEUTIGE Werte enthalten
- die Werte sind UNVERÄNDERBAR (ganze Elemente können nur hinzugefügt oder gelöscht werden)
Sie werden wie Dictionaries auch mit geschweiften Klammern gebildet - aber OHNE Doppelpunkt. Beispiel: ```s={"Wert1", "Wert2"}```. Die Eingabe-Reihenfolge ist aber NICHT zwangsweise die Position im Set. Alternativ kann eine Liste in ein Set umgewandelt werden: ```a_set=set(list)```. Duplikate werden dabei ohne Fehlermeldung gelöscht.   
Sets haben keinen Index und ein Subset kann nicht mit ```[]``` gemacht werden. Sie können mit der Methode ```sorted(set)``` geordnet werden. Dies wandelt das Set in eine Liste um.
### Tuples
Tupel werden mit der Syntax ```t=("Wert1","Wert2", ...)``` gebildet - oder mit der Tupel-Funktion aus einer anderen Datenstruktur erzeugt ```t=tuple(list)```.
Tuples sind unveränderbar (immutable)
- keine Änderung bestehender Werte
- keine Löschung
- kein Hinzufügen von Werten
und sind geordnet - subset mit ```[]``` funktioniert hier.
## Kontroll-Strukturen
### if/elif/else
```
if <Bedingung1> :  # WICHTIG: nach ':' MUSS nächste Zeile eingerückt sein
    <Kommando1>  
elif <Bedingung2> :  
    <Kommando2>
else:
    <Kommando3>
```
### for Loop
```
for val in sequence: # sequence/Iterable: alles, über das iteriert werden kann (List, Dictionary, ...)
    action
    # step increment
    # num_x += n ## Erhöhung um n je Schritt
```  
Für Dictionaries ist die Syntax:  
```
for key, val in d.items:
    print(key, val)
```  
Ein Iterable kann auch mit ```range(start, end+1)``` erzeugt werden. ```start``` ist inklusiv, ```end``` ist nicht inklusiv. Default-Wert für ```start``` ist immer 0.

### while Loop
```
while <Bedingung is True>:
   action
   if <Bedingung2 is True>
     break
```  
Über die Tastatur kann man einen while-Loop mit CTRL+C abbrechen.
## Errorhandling
### try - except
Innerhalb einer Funktion kann man das gewünschte Verhalten mit den akzeptierten Inputs in einen ```try``` Block aufnehmen und danach einen ```except```Block anschließen, der bei Fehlern im ersten Block ausgeführt wird.
### raise
Nach einem ```else``` kann man auch ein eingerücktes ```raise <Error Type>"spezifische Fehlermeldung"``` integrieren.

|try - except|raise|
|-|-|
|- verhindert Fehler und Programm-Abbruch|- Erzeugt Fehler mit Programm-Abbruch|
|- Nachfolgender Code wird ausgeführt|- Nachfolgender Code wird NICHT ausgeführt|


## Eingebaute Funktionen
|Funktion|Ergebnis|
|-|-|
|max()|größter Wert (auch alphabetisch)|
|min()|kleinster Wert (auch alphabetisch)|
|sum()|numerische Summe|
|round(wert, <Stellen>)||
|len()|Anzahl Elemente in Liste, Dictionary, Anzahl Zeichen in String|
|sorted()|alphabetisch aufsteigend geordnet|

## Iterators und Iterables
Nicht alle Strukturen haben einen internen Zähler - z.B. List. Sie können mit einem for-Loop abgearbeitet werden, haben aber nicht die typischen Funktionen ```next()``` oder können mit dem "Splat-Operator"  ```*``` alle auf einmal ausgegeben werden. Wenn man so etwas ergänzen will, kann man mit ```it = iter(<input>)``` einen entsprechenden Operator erzeugen.
Ein anderer Aspekt für Iterators ist die Chunk-weise Abarbeitung von riesigen Datenmengen, die nicht mehr in den Arbeitsspeicher passen.

Mit ```enumerate(<list>)``` kann man eine "zählerlose" Listen in die Klasse "enumerate" umwandeln, so dass die Liste der Einzelwerte zu einer Liste von Tupeln aus einer numerischen ID (beginnend mit 0, solange man nicht mit ```start``` einen anderen Wert mitgibt) und dem Listen-Wert entsteht. Das ```enumerate``` Objekt selber ist ein Iterable, über das man wieder loopen kann.
Mit ```zip(<list1>,<list2>)``` kann man zwei gleichlange Listen vereinen, so das jeweils aus zwei Einzeleinträgen EIN Tupel mit zwei Werten entsteht. Über die gesamte Liste der Tupel kann man wieder iterieren. Und man kann sie auch alle Tupel auf einmal im ```*``` ausgeben. Beispiel: ```print(*z)```
Ein Zip-Objekt (z.B. "z") kann man mit dem Splat Operator ```zip(*z)``` wieder in die ursprünglichen Listen aufspalten.

## List comprehensions
oder: "for-Loops in einer Zeile" 
Beispiel 1: ```new_nums=[num + 1 for num in nums] # nums ist eine Liste mit Zahlen```

Beispiel 2: ```pairs_2=[(num1, num2) for num1 in range(0,2) for num2 in range(6,8)] # ergibt 4 Tupel```

## Module 
Module sind "Standard"-Python-Skripte mit Funktionen und Attributen, die mit der Standard-Installation bereitstehen - und die man bei Bedarf importieren kann. Sie können mit folgenden Varianten ganz oder teilweise geladen werden:
- ```import <module_name>```  
- ```from <module_name> import <funktion1>[,[funktion2, ...]]> ```  
WICHTIG: "import" darf NICHT GROSS geschrieben werden.

Komplette Liste: https://docs.python.org/3/py-modindex.html

|Modul|Zweck|
|-|-|
|os|Interaktion mit Betriebssystem (Filesystem, ...)|
|collections|besondere Datenstrukturen|
|string|Zeichenketten-Manipulation|
|logging|Informationen loggen|
|subprocess|Terminal-Kommandos absetzen|

### os - nützliche Beispiele
|Funktion/Konstanten|Output/Klasse|Beschreibung|
|os.getcwd()|str|Kompletter Pfad des aktuellen Verzeichnisses|
|os.chdir("target")|n.a.|Arbeitsverzeichnis wechseln|
|os.environ|dict|Informationen zur Umgebung|

### string - nützliche Beispiele
|Funktion/Konstanten|Output/Klasse|Beschreibung|
||||
||||

### datetime - nützliche Beispiele
|Funktion/Konstanten|Output/Klasse|Beschreibung|
|date(yyyy,m,d)|datetime.date|Datum aus Integer-Werten erzeugen|

## Packages
Packages sind eine Sammlung von MEHREREN Modulen - auch Library oder Bibliothek genannt. Sie müssen erst aus dem PyPI (Python Package Index) über ein Terminal heruntergeladen werden, bevor sie importiert werden können.  
```python3 -m pip install <package name>```. Danach kann es Python mit ```import <package name> as <alias>``` verfügbar gemacht werden.
### Package NumPy
Arbeiten mit Zahlen

### Package requests
URL-Aufrufe erzeugen

|requests.get(url="https://app.database.com")|Responsecodes erhalten|

### Package pandas
```import pandas as pd```. Wichtigste Klasse, die bereitgestellt wird: ```pandas.core.frame.DataFrame``` - weiter nur noch DataFrame (oder df) genannt.
|Methode/Funktion|Ergebnis|Beschreibung|
|-|-|-|
|pd.DataFrame([dict|list|array])|DataFrame|Erstellt aus Input einen DataFrame (tabellarische Struktur)|
|pd.read_csv(<path/filename>[, chunksize=i])|DataFrame|Liest ein csv-File in einen DataFrame ein|
|df.head()|DataFrame|zeigt die ersten 5 Zeilen eines df|
|df["attrib"].mean()|<value>|Durchschnittswert eines (numerischen) Attributs|
|df["attrib"].sum()|<value>|Summe eines (numerischen) Attributs|

## Eigene Funktionen erstellen
### Definition einer Funktion
Eine Funktions-Definition hat folgende Struktur:
```
# Definitionskopf
def <Funktionsname>([Argument[, ...]]):
    # eingerückte Anweisungen
    ... 
    # Ausgabe (optional)
    return <output>
```
Argumente können positionsbezogen (Position Wert in einer mit Komma getrennten Liste) oder benannt (<keyword>=<Wert>) sein. Bei benannten Attributen kann ein Default-Wert festgelegt werden
"Undefiniert viele" Argumente können mit vorangestelltem * (<function(*args)>) zugelassen werden. Dabei wird alles, was einem * folgt, wie EINE Datenstruktur behandelt. Für keyword-Arrays kann man zwei ** verwenden: ```**kwargs```. Über das Input kann man dann mit ```for kwarg in kwargs.values():``` iterieren.

### Docstrings
Mit Docstrings kann den Code dokumentieren und über help() den Anwendern anzeigen. Wenn man NUR die Doku sehen will, kann man mit ```<Funktion>.__doc__``` (doc mit jeweils zwei Unterstrichen eingerahmt) aufrufen. Das nennt man auch "dunder-doc" Attribut. Der Output ist ein String (mit Sonderzeichen zur Formatierung wie \n).
Das erfolgt entweder als Einzeiler 
- Text mit jeweils DREI doppelten Anführungszeichen eingerahmt) oder 
- als zugewiesenen Wert des Attribut <function>.__doc__   
oder als Mehrzeiler machen. Dabei gilt:
- Der ganze Block mit """ eingerahmt
- Zusammenfassung erste Zeile
- leere Zeile
- "Args" ohne Einrückung
-   eingerückt: für jedes Argument (und dessen akzeptierten Datentypen) eine eigene Zeile
- "Returns" ohne Einrückung
-   eingerückt: für jede Return-Option Erläuterungen

## Lambda Funktionen
Mit  ```lambda argument(s): expression``` kann man einfache oder auch "anonyme" Funktionen erstellen, die weder eine "def"-Zeile noch eine "Return"-Anweisung benötigen.
### mit einem Argument (Einzelwert): 
```(lambda x: x*1.2)(25)``` 
### mit einem Argument (Liste): 
```(lambda x: sum(x) / len(x))[3,6,9]``` 
### mit zwei Argumenten: 
```(lambda x,y: x**y)[2,3]```
### mit Iterables
```
names=["Thomas","Sabine", "Maya", "Finja"]
capitalize=map(lambda x: x.capitalize(), names) #erzeugt ein map-Objekt
list(capitalize)
```

