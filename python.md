# Python - Cheatsheet

Kommentare werden mit dem # eingeführt: ```# Kommentar```.  
Ausgaben: ```print(<input>)```     
Infos: ```help(<function>)```  
Zeilen-Umbrüche: Backslash ```\```(Shift+option+7) 
## Variablen-Konventionen
MUSS: EIN Wort - keine Leerzeichen.   
Es gibt zwei Varianten: ```snake_case``` - alles klein, getrennt durch Unterstrich ODER ```CamelCase```: keine Leerzeichen, Beginn eines Wortes wird durch Großbuchstaben gekennzeichnet

## Operatoren
|Typ|Operator|Beschreibung|Ergebnis|
|-|-|-|-|
|Arithmetic|+|Addition|Summe|
|Arithmetic|-|Subtraktion||
|Arithmetic|*|Multiplikation|Produkt|
|Arithmetic|/|Division|Quotient mit Bruchteilen|
|Arithmetic|//|Floor/Integer Division|Quotient mit gerundeter Ganzzahl|
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
|truthy/falsy|bool()|True (wenn etwas NICHT leer/0 ist, False in anderen Fällen|

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
|"".replace(s1,s2)|'Alles A'|input.replace('A','B')|'Blles B'|
|"".lower()|'Aber Hallo'|input.lower()|'aber hallo'|
|"".upper()|'Aber Hallo'|input.upper()|'ABER HALLO'|
|"".startswith('x')|"Aber".startswith("A")|True|Case-sensitive|
|"".endswith()|"Aber".endswith("A")|False|Case-sensitive|
|in|"lang" in "Ein langes Leben"|True||
|"".join(iterable)|', '|', '.join(["1","2"])|"1, 2"|

### String-Ausgaben
### f-Strings (formatierter Ausgabe-String):  
Mit ```f""``` kann man Variablen mit anderen Python-Konstanten zu einem String-Objekt kombinieren und "leserlich" ausgeben.
Beispiel:
```
  cookie_name="Brownie"
  cookie_price=4.22

  print(f"Jeder {cookie_name} kostet {cookie_price}.")
```  
Mit f-Strings kann man auch FLOAT lesbar ausgeben: ```print(f"{0.0001:f})"``` kommt dann 0.0001 anstatt des Standards 1e-04. Float wird im Standard auf 6 Nachkommastellen gerundet. Will man mehr haben, ```print(f"{0.0000001:.7f})"```, muss man das mitgeben.

## Lists
Lists werden mit eckigen Klammern definiert - die einzelnen Elemente durch Komma getrennt. Die Elemente sind gem. Eingabe geordnet. Anhand ihrer Position (=Index) kann man auf sie zugreifen. WICHTIG: 1. Position ist die 0 (Zero-based indexing). Das letzte Element kann man mit dem Index ```list[-1]``` erreichen. Subsetting: die Elemente e1 bis en können mit ```list[<e1>:<e(n+1>)]``` ermittelt werden (n+1, weil das n+1-Element NICHT mit ausgegeben wird). Vom ersten bis n-ten Element: ```list[:(n+1)]```, ab dem n-ten bis zum Ende: ```list[n+1:]```. Mit doppeltem Doppelpunkt kann jedes n-te Element extrahieren - hier: jedes zweite ```list[::2]``` oder hier: jedes Dritte, starten an Position 2 ```list[1::3]```.  
### List-Methoden
list.append(<val>)

## Dictionaries / Maps
Ein Dictionary ist eine Sammlung von Key-Value-Paaren, die verändert werden kann (mutable). Man kann es mit ```dict()``` oder dem Shortcut ```{}``` initialisieren. Es wird mit geschweiften Klammern, Doppelpunkten und Kommas definiert. Beispiel: ```d={"Key1":"Wert 1", "Key2": Wert 2"}```. Auf die Werte kann man mit dem Key dann wieder zugreifen: z.B. mit ```d["Key1"]``` bekommt man ```"Wert 1"```. Alle Werte (ohne Keys) bekommt man mit ```d.values()```, die Schlüssel mit ```d.keys()```. Besser ist es aber mit ```.get("key"[,"Fehlermeldung])```: hier gibt es bei fehlendem Key ein "None" bzw. die definierte Fehlermeldung statt einem Runtime-Error. Eine alternativer effizienter - Weg ist der ```in``` Operator. Mit ```'key' in dict``` erhält man eine Boolean Antwort, ob der Key da ist oder nicht.    
Mit ```d.items()``` bekommt man das komplette Dictionary als Liste von Tupeln in der Form ```dict_items([('Key1','Wert1'),('Key2','Wert2')])```. Wenn ein Dictionary als Wert eine Liste enthält, kann man mit mit diesem Beispiel
```
for field, value in d["key"][0].items():  
    print(field, value)
```  
alle Werte einer Liste extrahieren.  
Neue Werte kann man mit ```d["Key3"]="Wert3"``` hinzufügen - bzw. den Wert eines bestehendes Tupels anhand des Keys aktualisieren. Für größere Mengen kann man die dict-Methode ```.update()``` nutzen. Tupel löschen kann man mit der ```del x["key"]``` Funktion - wenn der Key fehlt, wirft das aber einen Fehler. Besser ist die ```x.pop(key)``` Methode.

### Sets
Sets enthalten
- können nur EINDEUTIGE Werte enthalten
- die Werte sind UNVERÄNDERBAR (ganze Elemente können nur hinzugefügt oder gelöscht werden)
Sie werden wie Dictionaries auch mit geschweiften Klammern gebildet - aber OHNE Doppelpunkt. Beispiel: ```s={"Wert1", "Wert2"}```. Die Eingabe-Reihenfolge ist aber NICHT zwangsweise die Position im Set. Alternativ kann eine Liste in ein Set umgewandelt werden: ```a_set=set(list)```. Duplikate werden dabei ohne Fehlermeldung gelöscht.   
Sets haben keinen Index und ein Subset kann nicht mit ```[]``` gemacht werden. Sie können mit der Methode ```sorted(set)``` geordnet werden. Dies wandelt das Set in eine Liste um.   
Mit ```s.add(x)``` wird ein einzelner Wert hinzugefügt, mit ```s.update(<list>)``` können mehrere Elemente auf einmal integriert werden. Mit ```s.discard(<val>)``` können Werte sicher entfernt werden. Mit ```s.pop()``` wird "zufällig" ein Wert aus dem Set entfernt. Sets können mit den Methoden ```s.union(s2)``` (or), ```s.intersection(s2)``` (and) mengenmäßig verarbeitet werden. Mit ```s.difference(s2)``` bekommt man alle Datensätze in s, die nicht in s2 waren. Die Anzahl der Datensätze in einem Set kann mit ```len(set)``` abgefragt werden.
### Counter (package: collections)
Sonderform von Dictionaries. Nach ```from collections import Counter``` kann man mit ```Counter(<dict>)``` ein Aggregat erzeugen, in dem das Vorkommen jedes Schlüssels gezählt wird. Mit ```.most_common(x)``` erhält man die Keys absteigend sortiert nach Anzahl von Vorkommen. Mit x kann man das leicht auf die Top x beschränken.
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
Nach einem ```else``` kann man auch ein eingerücktes ```raise <Error Type> ("spezifische Fehlermeldung")``` integrieren.

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

Beispiel 3: if in Bedingung ```[num**2 for num in range(10) if num % 2 == 0]```

Beispiel 4: If/else im Output ```[member if len(member) >= 7 else '' for member in fellowship]````

In "allgemeiner Form" also: [output expression + conditional on output for iterator variable in iterable if conditional on iterable] 

Beispiel 5: Negative Zahlen von 0 bis 8 als Dictionary ```neg_dict={num: -num for num in range(9)}```

## Generator objects
Syntax: statt [] wie bei List comprehension werden () verwendet. Das Ergebnis wird NICHT als Liste im Arbeitsspeicher gehalten - sondern dient nur zur Iteration. Das kann helfen, wenn GROSSE Listen verarbeitet werden müssen und Arbeitsspeicher knapp wird. Beispiel: ()

## Generator function
```file: sequence.py
def num_sequence(n):
    """Generate values from 0 to n."""
    i = 0
    while i < n:
        yield i
        i += 1
```
## Batch-Verarbeitung: 10 Datensätze pro Batch
```'# Import the pandas package
import pandas as pd

'# Initialize reader object: df_reader
df_reader = pd.read_csv('ind_pop.csv', chunksize=10, parse_dates=["<Liste mit Datumsspalten>"], nrows=<Anzahl zu ladende Zeilen>)

'# Print two chunks
print(next(df_reader))
print(next(df_reader))
```

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
|-|-|-|
|```os.getcwd()```|str|Kompletter Pfad des aktuellen Verzeichnisses|
|```os.chdir("target")```|n.a.|Arbeitsverzeichnis wechseln|
|```os.environ```|dict|Informationen zur Umgebung|

### string - nützliche Beispiele
|Funktion/Konstanten|Output/Klasse|Beschreibung|
|-|-|-|
||||

### datetime - nützliche Beispiele
|Funktion/Konstanten|Output/Klasse|Beschreibung|
|-|-|-|
|```date(yyyy,m,d)```|datetime.date|Datum aus Integer-Werten erzeugen|

## Packages
Packages sind eine Sammlung von MEHREREN Modulen - auch Library oder Bibliothek genannt. Sie müssen erst aus dem PyPI (Python Package Index) über ein Terminal heruntergeladen werden, bevor sie importiert werden können.  
```python3 -m pip install <package name>```. Danach kann es Python mit ```import <package name> as <alias>``` verfügbar gemacht werden.

### Package NumPy
Numpy eignet sich besonders zum Arbeiten mit Zahlen. Das Package muss mit ```import numpy as np``` geladen werden.

Datentypen in Numpy sind
- np.bool_ (Wahrheitswerte True oder False)
- pn.int8 (2 hoch 8: -256 bis 255)
- pn.int16 (2 hoch 16)
- np.int32 (2 hoch 32: 4.294.967.296 Zahlen von -2.147.483.648 bis 2.147.483.647)
- np.int64 (2 hoch 64: )
- np.float32
- np.float64 (2 hoch 64: )
- <U12 Unicode Elemente mit max 12 Zeichen
Der Datentyp in einem Array wird aus dem "höchstwertigen" Typ bei Erstellung des Arrays abgeleitet (type coercion). 

|Funktion|Zweck|
|-|-|
|np.array([<list>], dtype=np.<Datentyp>)|Liste in 1-dimensionales Numpy-Array umwandeln|
|np.array([[<list>],[<list>]])|List of lists in 2-dimensionales Numpy-Array umwandeln|
|np.array(<2D List 1>,<2D List 2>,<2D List 1>)|aus 3 2-dimensionalen Arrays eine 3D Array erstellen|
|np.zeros((<r>, <c>))|Array mit Nullen mit r Zeilen und c Spalten aufbauen|
|np.random.random((r,c))|Array aus Zufallszahlen (0-1) mir r Zeilen und c Spalten aufbauen|
|np.arange(s,e)|Liste mit einer (ganzzahligen) Zahlenfolge von Start s bis Ende e|
|np.sort(array, axis=a)|sortiert (optional nach Axen (axis a): Default ist die höchste Dimension. Bei 2D Arrays haben die Zeilen 0 und Spalten 1|
|np.vectorize(<function>)|verwandelt eine Python Funktion in eine Vektor-Funktion, die auf np-Array-Elemente angewendet werden kann (Beispiele: vf=np.vectorize(len) oder (str.upper))|
|np.flip(array, axis=(0,1,...)|alle Elemente eines Arrays (optional: nur bestimmte Achsen) umdrehen (erhält dabei den Shape)|
|np.transpose(array, (Tuple mit ALLEN Spalten, geänderte Reihenfolge))|wandelt Spalten in Zeilen und Zeilen in Spalten um - ändert aber nicht die Sortierung der Elemente - der shape wird verändert|
|np.split(array, <Anzahl Zeilen in Ziel-Liste>, axis=i)|axis=0 sind Zeilen|
|np.stack(array1, array2, array3, axis=2|drei GLEICHDIMENSTIONALE Array zusammenfügen.|

## Daten laden/sichern

### python - Standard
filename="file.txt"
file = open(filename, mode="r") # 'r' is to read
text = file.read()
file.close()

KURZFORM mit Kontext-Manager "with":
```with open(filename, mode="r") as file:```   
```   print(file.read())```
```print(file.read()) # EINE Zeile anzeigen```   

### Daten laden mit Numpy
Numpy hat kann mit *.txt, *.csv, *.pkl Formate umgehen - aber am effizientesten ist das eigene *.npy Format.

```np.loadtext(filename, delimiter = ",", skiprows=0 use_cols=[0,2], dtype=str)```


Daten einlesen (Modus Read Binary = "rb"):   
  with open("<path+file_name>", "rb") as f:
    array = np.load(f)
  
  plt.imshow(array) // als Bild-Ausgabe vorsehen
  plt.show() 

Daten schreiben (Modus Write Binary = "wb"):   
  with open("<path+file_name>", "wb") as f:
    array = np.save(f, <Source>)

### Daten laden mit Pandas

```df=pd.read_csv(file,nrows=i, header=None, sep="\t", comment="#", na_values=["Nothing"])```. Optional kann das auch in ein Numpy-Array umgewandelt werden: ```df.to_numpy(df)```.

Pickled Files: Python data-File, in binär-Form
```import pickle```   
```with open("file.pkl","rb") as file:  ```
```    data=pickle.load(file)```

Excel mit Pandas   
Laden: ```data = pd.ExcelFile("File.xlsx")```, dann die Reiter mit ```data.sheet_names``` anschauen
Daten aus Reitern einlesen mit ```data.parse("Name Reiter")``` oder ```data.parse(Index Reiter, parse_cols[index (0-based)], skiprows="0",names=['col_name'], comment="#")```  

## Python mit SQL-Datenbanken koppeln
```from sqlalchemy import create_engine```  
```engine = create_engine('sqlite:///Northwind.sqlite'```  
```table_names = engine.table_names()```  
```print(table_names)```  
### sqlalchemy - ohne Kontext-Manager
```con = engine.connect()``` 
```rs = con.execute('SELECT * FROM Orders')```  
```df = pd.DataFrame(rs.fetchall())```  
```df.columns = rs.keys()```  
```con.close()```  
### sqlalchemy - mit Kontext-Manager
```with engine.connect() as con:``` 
```    rs = con.execute('SELECT OrderID, OrderDate FROM Orders')```  
```    df = pd.DataFrame(rs.fetchmany(size=5))```  
```    df.columns = rs.keys()```  
### sqlalchemy + pandas
```df = pd.read_sql_query('SELECT * FROM Orders', engine)``` 


## Arrays
|Array-Attribut|Ergebnis|
|-|-|
|array.shape Dimensionen| Tupel der Dimensionen (Zeilen, Spalten, ...)|
|array.dtype|Zahlentyp im Array, z.B. dtype('float64')|

|Array-Methoden|Ergebnis|
|-|-|
|array.flatten()|Array in 1D Liste umformen|
|array.reshape((<tuple>))|Array in Zieldimensionen gem. <tuple> umformen|
|array.astype('dtype')|Datentyp im Array ändern (Type conversion)|
|array.sum(axis=0)|axis Parameter: ohne = über alles, mit axis-Parameter 0 je Spalte, mit 1 je Zeile|
|array.min(axis=0, keepdims=True)|siehe .sum + optional keepdims: erhält die anderen Dimensionen für leichteren Merge |
|array.max()|siehe .min()|
|array.mean()|siehe .min()|

#### Slicing
Elemente ermitteln (Slicing) wird mit eckigen Klammern und - für jede Dimension - start(inklusiv), stop(exklusiv(optional), stepsize(optional, default: 1)) gemacht ```array[start:stop:stepsize, start:stop:stepsize, ...]```.   
#### Filtern mit Masken (Fancy Indexing)
Gibt Arrays mit allen Elementen zurück:  
one_to_five = arange(1:6)  
mask = one_to_five % 2 == 0 # boolean mask  
one_to_five[mask] # mask anwenden  
gibt nur die Elemente zurück, die der Bedingung entsprechen.   
#### np.where()
Ergibt ein Array aus Indizes (= Tuple aus Arrays). Man kann damit aber auch Einzelwerte verändern. Beispiel: mit ```np.where(sudoku == 0,"", sudoku)``` werden alle Elemente im Array sudoku, die den Wert 0 haben, gelöscht.
#### Zusammenfügen
Beim Zusammenfügen müssen die Dimensionen passen (beim Hinzufügen von Spalten muss die Anzahl der Zeilen im ersten Array mit denen der Zeilen im zweiten Array übereinstimmen). ```np.concatenate(array1, array2)``` an der ersten Achse (=Zeilen) hinzufügen. Wenn Spalten hinzugefügt werden sollen: ```np.concatenate((array1, array2), axis=1)```
#### In Arrays löschen
Mit ```np.delete(array, 1, axis=0)``` kann man die 2. Zeile eines Arrays löschen. Mit ```np.delete(array, 1, axis=1)``` kann man die 2. Spalte löschen.

### Package datetime
import datetime as dt
today_date = dt.date.today()

oder: 
    from datetime import datetime
    two_dates = [date(2016,10,23),date(2017,6,14)]
    print(two_dates[0].weekday) # Wochentage von 0 Montag bis 6 Sonntag

Ausgabe formatieren: ```dt.strftime("%Y-%m-%d %H:%M:%S"))``` 
Datumsteile ändern: ```dt.replace(year=2000)```
ISO8601-Format: ```dt.isoformat()``` ergibt YYYY-MM-DDTHH:MM:SS

Zeit parsen mit ```dt = datetime.strptime("12/30/2003 15:19","%m/%d/%Y %h:%M")```  

|Format-String|Ergebnis|
|-|-|
|%Y|4-stelliges Jahr|
|%m|2-stelliger Monat|
|%d|2-stelliger Tag|
|%H|2-stellige Stunde (0-23)|
|%M|2-stellige Minute|
|%S|2-stellige Sekunde|
|%B|Monatsname|

Unix-Timestamp (Anzahl Sekunden seit 1.1.1970) lesen: ```datetime.fromtimestamp(ts)``` 

    from datetime import timedelta #Zeitdifferenzen
    delta1 = timedelta(days=1, seconds=1)

#### UTC

    from datetime import datetime, timedelta, timezone
    # US Eastern Standard timezone
    ET = timezone(timedelta(hours=-5))
    # Timezone-aware datetime
    dt = datetime(2017,12,30,15,9,3, tzinfo=ET)
    # Indian Standard time
    IST = timezone(timedelta(hours=5, minutes=30))

```print(dt)``` ergäbe dann ```2017-12-30 15:09:03-05:00```. ```print(dt.astimezone(IST))``` wäre dann 10 Stunden später ```2017-12-31 01:39:03-05:00```. Mit ```dt.replace(tzinfo=timezone.utc)``` wird der UTC-Offset gelöscht: dt würde zu ```2017-12-30 15:09:03+00:00```. Mit ```dt.astimezone(timezone.utc)``` wird der Offset gelöscht, aber die Zeit geändert ```2017-12-30 20:09:03+00:00```.


#### Timezone Datenbank
    # Imports
    from datetime import datetime
    from dateutils import tz
    # Eastern time
    et = tz.gettz('America/New York')

Zeit-Angaben mit Zeitangaben anreichern: ```rides[start_dt].dt.tz_localize('America/New_York', ambiguous='NaT')```. Die Zeitzone ändern geht mit ```rides[start_dt].dt.tz_convert('Europe/London', ambiguous='NaT')``` 

### Package requests
URL-Aufrufe erzeugen

|Befehl|Ergebnis|
|-|-|
|```requests.get(url="https://app.database.com")```|Responsecodes erhalten|


### Package pandas
```import pandas as pd```. Wichtigste Klasse, die bereitgestellt wird: ```pandas.core.frame.DataFrame``` - weiter nur noch DataFrame (oder df) genannt.

Erzeugen: mit pd.DataFrame(<list>, <dict>)
1. List of dicts: ```l = [{"key1":"val1", "key2":"val2"},{"key1":"val1a", "key2":"val2a"} ]```
2. Dicts of lists ```d={"key1":["val1","val1a"], key2:["val2","val2a"]}```

|Methode/Funktion|Ergebnis|Beschreibung|
|-|-|-|
|```pd.DataFrame([dict/list/array])```|DataFrame|Erstellt aus Input einen DataFrame (tabellarische Struktur)|
|```pd.read_csv(<path/filename>[, chunksize=i], index_col=['col'], dtype=<Dictionary mit "col_name":"dtype" Paar(en)>, parse_dates=['col_d1','col_d2'])```|DataFrame|Liest ein csv-File in einen DataFrame ein|
|pd.to_csv(<path/filename>)|File|erstellt ein csv-File aus einem DataFrame|
|df.head()|DataFrame|zeigt die ersten 5 Zeilen eines df|
|df.size()|DataFrame|Zeigt die Anzahl der Einträge - bzw. bei gruppierten Dataframes die Einträge in den Gruppen des df|
|df.duplicated(subset = column_names, keep = False)|Zeilen in df|subset: Liste mit zu prüfenden Spalten, keep: "first" = erstes Vorkommen, "last" = letztes Vorkommen, "False" = ALLE erhalten|
|df["attrib"].mean()|<value>|Durchschnittswert eines (numerischen) Attributs|
|df["attrib"].sum()|<value>|Summe eines (numerischen) Attributs|
|df["attrib"].to_numeric()|<value>|Spaltenwert in Zahl umwandeln|
|pd.to_datetime(df["char_time_col"], infer_datetime_format=True,errors = 'coerce')|<value>|Spaltenwert in Zeit umwandeln; errors 'coerce' erzeugt NA, wenn das Format nicht erkannt wird|
|df["new_col"]=pd.to_datetime(df[["year","month","day"]])||Mehrere Spalten zu einem Datum zusammenfassen|
|df["date_col"].dt.month/day/year|Integer|Wert Datumsbestandteil auslesen|
|df["attrib"].astype(int|str|float|dict|list|bool)|<value>|Spaltenwert als Integer|... behandeln|
|df.head()|erste Zeilen anzeigen||
|df.info()||Zeigt Spalten-Namen samt Anzahl NOT NULL Werte und Datentype an|
|len(df)|Integer|Anzahl Zeilen|
|df.shape|Tupel (Anzahl Zeilen, Anzahl Spalten)|Struktur |
|df.dtypes||Zeigt NUR die Datentypen aller Attribute an|
|df.describe()|Tabelle/Spalte|Zusammenfassungen/Statistiken|
|df.values|Array|Eine Liste aller Rows (wiederum als einzel-Liste|
|df["attrib"].nbytes||Speicherbedarf Spalte|
|df.columns|Liste|Liste aller Spalten-Namen|
|df.rename(columns = {'col_old':'col_new','col2_old':'col2_new'}, inplace = True)|Spalte umbenennen|
|df.index|RangeIndex|Beschreibung Index mit start, stop, Schrittweite|
|df.size|Integer|Anzahl Einträge; Alternativ: df.shape[0]|
|df.sort_values(["Col_name", "Col2", ...] [, ascending=False])|Tabelle|Sortierte Ausgabe Reihen|
|dr.resample('D', on='Start date')['Duration in Sec'].mean().plot()|Plot|Entwicklung durchschnittliche Dauer pro Tag|
|df[["Col1", "Col2"]]|Tabelle|Spalten auswählen|
|df["Col1"].isin(["Val1","Val2"])|Logischer Filter-Vektor|Alle Zeilen-IDs, die einer der Ausprägungen entsprechen|
|~|Negation|df[Mit ~"Col1"].isin(["Val1"]) sucht man alle Felder, die NICHT den Suchkriterien entsprechen|
|df.select_dtypes('number|object').head()|Tabelle|Nur die ersten 5 Zeilen von Spalten eines definierten Typs ausgeben|
|df["col"].nunique()|Liste|Anzahl der UNIQUE-Werte eines Attributes|
|df["col"].str.contains("<searchstring>|<searchstring2>")|Boolean Series|als Filter|
|df["col"].isin(['x','y','z'])|auf bestimmte String-Werte filtern|
|df.drop(columns=["col1"], inplace=True)|reduzierter DataFrame|Spalten löschen|
|df.drop(<Index Zeile, axis=0>)|gelöschte Zeile(n)|reduzierter DataFrame|
|df.drop(df[df['col']> 4].index, inplace = True)|alle Datensätze gem. Bedingung löschen|
|df.drop_duplicates(subset=['col1','col2'])|df ohne Duplikate|Duplikatserkennung anhand der Liste der Attribute|
|df['Gruppierungsspalte'].value_counts(sort=True|normalize=True)|Serial|Anzahl sortiert|%-Anteil)|
|df.agg(["mean","std"])|MEHRERE Aggregat-Funktionen auf ALLE numerischen Spalten anwenden||
|df.agg({"col1": ["mean","std"],"col2":["median"]})|BENANNTE Aggregate auf mehrere Spalten||
|df.groupby('Gruppierungsspalte')['<Messspalte>'].sum/min/max/var/std/count()|Aggregate||
|df.groupby('Gruppierungsspalte').agg(new_col_name=("<Messspalte", "<Agg-Funktion>"), new_col2_name=("<Messspalte", "<Agg-Funktion2>"))|mehrere neue Spalten mit neuen Namen||
|df.set_index("Col1")|Ändert "Col1" in Index|Wert statt 0 - n; kann auch mehrere Spalten in einer Liste enthalten|
|df.reset_index(inplace=True)|Index Reset|Macht aus Index wieder eine Spalte; Option zum Löschen: drop=True|
|df.loc[['Index-Wert'],['Spaltenwert] ]|Subset|kann auch mit [Liste von Indezes] angesprochen werden; bei Slices ist der letzte Wert ENTHALTEN!|
|df.loc[df['colname'] == 'x'] = 'Y'||Updates von Spaltenwerten, auf die 'x' zutrifft|
|df.iloc[[r1:rx],[c1:cn]]|Subset|mit Integer-Werten (oder Slices) selektieren|
|series.at[x]|Scalar|Wert an Position x|
|df.at[index[x],"col"]|Scalar|Wert in Zeile index[x], Spalte "col"|
|df.sort_index()|sortierter df|Optionen: Listen mit level=["col1", "col2"], ascending=[True, False]|
|df['col2'].dt.year|Jahr aus Datum|Datumswerte extrahieren|

## set Operationen
```diff = set(df1['col']).difference(df2['col'])``` findet in df1 Kategorien in col, die nicht in den Werten von df2 sind. Solche Inkonsistenzen kann man mit ```df['col'].isin(diff)``` finden - und bereinigen. Oder per Negation per Tilde nur saubere Datensätze ausgeben ```df['col'].isin(~diff)```.

## Reshaping: LONG vs. WIDE - pivot und melt
LONG: Pro Zeile EIN Feature, EINE Beobachtung auf MEHRERE Zeilen verteilt   
WIDE: EINE Beobachtung pro Zeile (mit MEHREREN Features)
LONG to WIDE: pivot  
WIDE to LONG: melt  

|Pandas Befehl|Ergebnis|Erläuterung|
|-|-|-|
|df.pivot(index="<col als Zeilenindex>", columns="<col(s) für neue Spalten>", values="<col(s) in neuen Feldern>")|neuer Df|Voraussetzungen: index/col - Paar ist UNIQUE, keine Aggregate möglich|
|df.pivot_table(index='Gruppierung', columns='Spalten', values='Wert(zum aggregieren)')|Tabelle|Optionen: aggfunc=[np.func], columns = <weiterer Agg-Level>, fill_value = 0 (0 statt NaN bei leeren Werten), margins=True (Aggregate gem. Definition für ALLE Spalten und Zeilen hinzufügen|
|df.transpose()|DataFrame|Spalten in Zeilen und Zeilen in Spalten umwandeln|
|pd.crosstab(df['col_index'],df['col2'])|Tabelle|Zählt Kombinationen in Tabelle für jede Ausprägung der beiden Spalten|
|pd.crosstab(df['col_index'],df['col2'],values=df['col_x]', aggfunc('function(e.g. mean)'))|Tabelle|Berechnet Wert für jede Kombination der Ausprägung der beiden Spalten|
|df.melt(id_vars='<col(s) Identifier>', value_vars='feature(s)',var_name='neuer feature-name', value_name='neuer value-name')|Df|Umwandeln (unpivot) von "wide" auf "long"-Format.|
|pd.wide_to_long(df, stubnames = ["prefix1","prefix2"], i="Index1 Ziel-Spalte",j="Index2 Ziel-Spalte")||Optionen: sep="_" (wenn die Zahl nicht direkt folgt), suffix='\w+' (wenn Suffix keine Zahl ist|

## pandas: Merge Data
### Methode merge()
|Join-Typ|pandas-Befehl|
|INNER JOIN|df1.merge(df2, on=['col1','col2'], suffixes=('_for_df1','_for_df2'))|
|LEFT JOIN|df1.merge(df2, on=['col1','col2'], how='left')|
|RIGHT JOIN (unterschiedliche Spaltennamen|df1.merge(df2, how='right', left_on='col1', right_on='col2'])|
|OUTER JOIN (unterschiedliche Spaltennamen|df1.merge(df2, how='outer', left_on='col1', right_on='col2'], suffixes=('_for_df1','_for_df2'))|
|JOIN auf Index|df1.merge(df2, left_on="col1", left_index =True, right_on="col2", right_index=True|
Hinweis: mit der Option ```indicator=True``` erhält man die Spalte ```_merge```, die die Quelle des Datensatzes zeigt (left_only, both, right_only)

Merge - weitere Optionen
|Option|Auswirkung|mögliche Parameter|
|suffixes|Namenssuffix für namensgleiche Spalten|kommagetrennte Strings|
|indicator|ergänzt Ergebnis-df mit Spalte '_merge' mit Herkunft Datensatz|'both','left_only','right_only'|
|validate|Prüft Relation und wirft ggf. 'MergeError'|'one_to_one', 'one_to_many','many_to_one','many_to_many'|
### Methode merged_ordered()
Die Methode eignet sich besonders für Time-Series Merges, da das Ergebnis nach dem on-Kriterium sortiert wird.
Unterschiede zu merge():
- Aufruf: wird ```pd.merge_ordered(df1, df2, how='inner|left|right|outer' on='<col1>')
- Default JOIN Typ: 'outer'
- Optionen zum Umgang mit Missing Values: ```fill_method``` mit den Parameter ```ffill``` (Forward fill: NaN-Wert wird durch letzten bekannten Vorgänger-Wert ersetzt). 

### Methode merge_asof()
wie merge_ordered() left join, ABER: geht auf den nächsten Schlüsselwert (kleiner), nicht zwingend auf ein konkretes Match. Voraussetzung: Spalten müssen SORTIERT sein.
```pd.merge_asof(df1, df2, on='col', suffixes=('_x_','_y'), direction='forward|nearest|backward')```
## pandas: Filter Joins
SEMI JOIN: Filter-Vektor: Nur col's von LINKS, die in RECHTS sind, keine Duplikate ```df['col1'].isin(df2['col1'])```   
ANTI JOIN: Nur col's von LINKS, die NICHT in RECHTS sind
1. df mit _merge erstellen: ```base=df['col1'].merge(df2, on='col1', how='left', indicator=True)```
2. Filter-Vektor erstellen: ```f=base.loc[base['_merge'] == 'left_only', 'col1']]```
3. Filter anwenden: ```base[base['col1'].isin(f)]```

## pandas: Concatenation
Basis: ```pd.concat([df1, df2, ...])```. Option  ```ignore_index=True``` verwirft die Indize der Ursprungs-DFs. Mit ```keys=['label_df1','label_df2',...]``` können Labels im Index ergänzt werden. Mit ```join='inner'``` werden nur Spalten genommen, die in ALLEN Tabellen vorhanden sind. Ohne diese Option werden Spalten, die in einigen DFs fehlen mit NaN gefüllt.
Die Option ```verify_integrity=True``` verhindert die Entstehung von Duplikaten im Index und wirft einen 'Value Error'.
## pandas: .query()
Mit ```df.query('query String')``` kann man "SQL-ähnliche Abfragen gegen einen DataFrame schiessen.
## pandas: Missing values finden
df.isna() : pro Wert ausgeben
df.isna().any() : Info pro Spalte, ob mindestens ein Wert fehlt - oder nicht
df.isna().sum(axis = 0): Anzahl der fehlenden Werte (Spalte (default): axis = 0, für Zeile: axis =1) 

## pandas und JSON
Mit dem Package ```from pandas import json_normalize``` kann man
nested json in einen Dataframe umwandeln: ```json_normalize(df)```. Bei komplexeren Strukturen kann ein Unterziel angeben, um nur Unter-Strukturen zu bekommen: ```json_normalize(df, record_path='<key>')```. Optional können noch zusätzliche Über-Attribute übernommen werdne ```json_normalize(df, record_path='<key>', meta=['val1','val2'])``` 

### pandas: Schwellwert (mehr als 5% n/a Werte pro Spalte => verwerfen )
1. ```threshold = len(df) * 0.05```  
2. ```cols_to_drop=df.columns[df.isna().sum() <= threshold>]```
3. ```df.dropna(subset = cols_to_drop, inplace=True)```   
Zeilen, die mindestens ein na haben löschen; inplace=True bedeutet: "ändere den df"   
### pandas: stack, unstack, explode
1. Multi-Index Df umwandeln: wide to long: ```df.stack(level=<Index-Spalte>)``` bzw. long to wide mit ```df.unstack()```
2. list-like Spalten (mehrere Werte in einer Zelle) auf mehrere Zeilen aufspalten: ```df['column to expand'].explode()``` oder gleich auf den df anwenden: ```df.explode('column to expand')```

### Umgang mit fehlenden Werten
#### Übersicht
Statistische Übersicht: ```df.isna().sum()```
Grafische Übersicht
   import missingno as msno
   import matplotlib.pyplot as plt
   msno.matrix(df)
   plt.show()

#### NA´s Befüllen

1. ```df.fillna(0)```: füllt leere Werte mit 0
2. Pauschal mit mode() befüllen: ```cols_with_missing_values = df.columns[df.isna().sum()>0] \ for col in cols_with_missing_values[:-1]: \   df[col].fillna(df[col].mode()[0]) ```
3. Pro Untergruppe berechnen: ```df_dict= df.groupby("group_col")["value_col"].median().to_dict()\ df["value_col"]=df["value_col"].fillna(df["group_col"].map(df_dict))```
4. ```df.fillna(method="ffill")```: füllt leere Werte mit Wert des Vorgängers
### df - unterschiedliche (kategorische) Werte je Spalte analysieren
```
    non_numeric = df.select_dtypes("object")```  
    for col in non_numeric.columns:     
        print(f"Number of unique values in {col} column: ", non_numeric[col].nunique())
```  
Man kann diese Zeichen von dtype="O" (für Objekt) mit .astype("category") in dtype"category" umwandeln. Mit pd.Categorical(<Series>, categories=["A","B","C"], ordered=True) kann man ordinale (geordnete) Kategorien vergeben.

```
# Gleichmäßige Gruppen mit qcut nach Distribution
    group_names = ["Kategorie 1", "Kategorie 2", "Kategorie 3"]
    pd["new_col"]=pd.qcut(df['col'], q = 3, labels = group_names) 
```
```
# Gruppen mit cut nach ranges
    ranges = [0, 100,200, np.inf]
    group_names = ["0 - 100", "101 - 200", "201+"]
    pd["new_col"]=pd.cut(df['col'], bins = ranges, labels = group_names)    
```


### Series - Daten umwandeln
df["col"].str.replace("<orig>","<new">)  
df["col"].str.split('@', expand = True)
df["col"].astype('float'|'int'|'category'...)   
df["new_col"]=df.groupby("group_col")["agg_col"].transform(lambda x: x.std())
df["col"].str.cat(df["col2"].str, sep=" ")

### Eigene Kategorien vergeben - anhand Zeichen
1. Liste mit eigenen Kategorien erzeugen: ```categories=['A','B',C']
2. Kategorien definieren
2.1 A = "<str1>|<str2>"
2.2 B = "<str3>|<str4>"
2.3 C = "<str5>|<str6>"
3. Bedingungen zusammenfassen ```conditions=[(df.["col"].str.contains(A)),(df.["col"].str.contains(B)),(df.["col"].str.contains(C))]````
4. Neue Spalte befüllen: ```df["new_col"] = np.select(conditions, categories, default="Other")```  

### Eigene Kategorien aus numerischen Variablen erstellen - über Binning
1. Bins (hier: Quantile) bestimmen
1.1 twenty_fifth = df["num_col"].quantile(0.25)
1.2 fifties = df["num_col"].median()
1.3 seventy_fifth = df["num_col"].quantile(0.75)
1.4 maximum = df["num_col"].max()
2. Liste mit Labels erstellen: ```labels = ["A","B","C","D"]```
3. Liste mit Bins erstellen: ```bins = [0, twenty_fifth, fifties, seventy_fifth, maximum]```
4. Kategorie-Spalte erstellen (mit ```pd.cut```):   
``` 
df["new_cat_col"] = pd.cut(df["num_col"],\
                                labels = labels,\
                                bins = bins)
```  
### Kategorien über ```mapping``` zusammenfassen
```
   # creating mapping dictionary and replace
   mapping = {'Microsoft':'DesktopOS', 'MacOS':'DesktopOS', 'IOS':'MobileOS', 'Android':'MobileOS'}
   devices['operation_system'] = devices['operating_system'].replace(mapping)
```
### Arbeiten mit Kategorien
Kategorie-Series haben ```cat``` Eigenschaften.
Mit ```Series.cat.categories``` werden die definierten Kategorien angezeigt. 

Series.cat.set_categories Accessor - Parameter:
- ```new_categories```: Liste neuer Kategorien
- ```inplace```: Boolean - soll das Update ggf. bestehende Serie überschreiben oder nicht
- ```ordered```: Boolean - sind die Kategorien sortiert - beginnen mit der kleinsten in der Liste
Weitere Accessors: 
- add_categories(): neue Kategorien definieren (über ```series.cat.categories``` einsehbar) (noch keine Vergabe) ```Series.cat.add_categories(<Liste mit neuen Kategorien>)```
- remove_categories(): Kategorien löschen ```series.cat.remove_categories(removals=["<zu löschende Kategorie>"]```
- rename_categories(new_categories=<dict>)
- reorder_categories(new_categories=<dict>, ordered=True/False) ```Series.cat.reorder_categories(removals=[new_categories=<dict>, ordered=True, inplace=True]```  

Codes für Kategorien anlegen: ```df["Kategorie"]=df["Kategorie_Code"].astype("category").cat.codes```. Info: Alphabetische Kategorien werden aufsteigend sortiert - A bekommt 1, ...
Danach kann man ein "Code Book" anlegen:  
1. ```codes=df["Kategorie_Code"].astype("category").cat.codes```
2. ```categories=df["Kategorie_Code"]```
3. ```name_map= dict(zip(codes, categories))```

Verteilung in einer Serie anschauen: ```series.value_counts(dropna=False)```

Updates in Series: Beispiel "maybe" => "no"
```dogs.loc[dogs["likes_children"] == "maybe", "likes_children"] = "no"```   
```dogs["get_along_cats"] = dogs["get_along_cats"].str.strip()```   
```replace_map={"Noo":"No"}```  
```dogs["get_along_cats"].replace(replace_map, inplace=True)```

### one-hot-encoding
Eine Kategorie-Spalte mit X Werten in X Spalten mit Werten 0/1 und Spaltennamen "Kategorie-Spalte + "_<Kategorie x>" umwandeln. Wichtig: Bei get_dummies bleiben numerische Spalten unverändert. Die Original-Spalte wird gelöscht.
```df_one_hot = pd.get_dummies(df[["cols to encode","col2"]])```   
Wenn nur eine Spalte geändert werden soll, ist die Syntax:
```df_one_hot = pd.get_dummies(df, columns=["col to encode"], prefix="")```   
## String-Vergleiche 
  from thefuzz import fuzz
  fuzz.WRatio('str1','str2')
Die WRatio gibt die Ähnlichkeit an (von 0 überhaupt nicht ähnlich bis 100 identisch).

## Mit JSON arbeiten
Voraussetzung: Modul mit ```import json``` laden.   
Dann kann man eine Spalte mit nested data laden, darauf json.loads anwenden(=JSON-String in Python dict umwandeln) und das Ergebnis in ein Series-Objekt umwandeln (jeden Key in eine eigene Spalte umwandeln): ```books=collection['books'].apply(json.loads).apply(pd.series)```. Danach kann man die Spalte mit den nested data löschen ```collection = collection.drop(columns='books')``` und dann die verbleibenden Spalten mit den aufgespaltenen nested data zusammenführen: ```pd.concat([collections, books], axis=1)```.   
Anderer Ansatz: Nested column in eine List umwandeln ```books = collection['books'].apply(json_loads).to_list```. Dann das JSON Objekt in einen String umwandeln: ```books_dump=json.dumps(books)``` und den JSON-String dann in eine Dataframe einlesen: ```new_books = pd.read_json(books_dump)```. Im Anschluss wieder die "Meta-Spalten" (als DataFrame!) mit dem neuen Dataframe zusammenbringen ```pd.concat([collection['writers'], new_books], axis=1)```.

## Eigene Funktionen erstellen
Ratschläge: DRY (don't repeat yourself) and "Do ONE thing" (einfacher verständlich, besser testbar, leichter zu debuggen)
### Definition einer Funktion
Eine Funktions-Definition hat folgende Struktur:
    # Definitionskopf
    def <Funktionsname>([Argument[, ...]]):
    """Docstring - Documentation"""
    # eingerückte Anweisungen
       try:  
       # Code 
    # Ausgabe (optional)
        return <output>
       except TypeError:
         print("spezifische Fehlermeldung")
    # Code, der IMMER ausgeführt werden muss
       finally:
           print("Das wird IMMER ausgeführt")

Argumente können positionsbezogen (Position Wert in einer mit Komma getrennten Liste) oder benannt (<keyword>=<Wert>) sein. Bei benannten Attributen kann ein Default-Wert festgelegt werden. Wenn der Default LEER ist, gilt ```paramer=None```.  
Wenn einem Argument-Namen mit dem = ein Wert zugeordnet wird, ist das der Default-Wert.  
"Undefiniert viele" Argumente können mit vorangestelltem * (<function(*args)>) zugelassen werden. Dabei wird alles, was einem * folgt, wie EINE Datenstruktur (= Tupel) behandelt. Für Keyword-Arrays kann man zwei ** verwenden: ```**kwargs```. Über das Input kann man dann mit ```for kwarg in kwargs.values():``` iterieren.
### Scope
Such-Reihenfolge des Python-Interpreters:
1) local
2) non-local
3) global
4) built-in
### Closures
Funktion speichern Kontext-Informationen wie Variablen in "Closures" (nonlocal Variable, die an eine Funktion angehängt wird). Ob und wieviele es gibt, kann mit ```len(func.__closure__)``` abgefragt werden. Was darin steckt, wird über```func.__closure__.cell_contents``` ermittelt.
### Decorators (Wrapper-Funktion)
Mit einem Decorator kann man Funktionen "uminterpretieren/ergänzen". Beispiel:

    from functools import wraps
    
    def print_before_and_after(func):
      # dekorieren, damit Metadaten nicht verloren gehen
      @wraps(func)
      def wrapper(*args):
        print('Before {}'.format(func.__name__))
        # Call the function being decorated with *args
        func(*args)
        print('After {}'.format(func.__name__))
      # Return the nested function
      return wrapper

    @print_before_and_after
    def multiply(a, b):
      print(a * b)

    multiply(5, 10)
    
    # ergibt als Output:
    Before multiply
    50
    After multiply

    # Metadaten abfragen
    print(multiply.__docstring__)
    # 

### Docstrings
Mit Docstrings kann den Code dokumentieren und über help() den Anwendern anzeigen. Wenn man NUR die Doku sehen will, kann man mit ```<Funktion>.__doc__``` (doc mit jeweils ZWEI Unterstrichen eingerahmt) aufrufen. Das nennt man auch "dunder-doc" Attribut. Der Output ist ein String (mit Sonderzeichen zur Formatierung wie \n). Alternative mit dem ```inspect``` Package: ```inspect.getdoc(function)```.  
Das erfolgt entweder als Einzeiler 
- Text mit jeweils DREI doppelten Anführungszeichen eingerahmt) oder 
- als zugewiesenen Wert des Attribut <function>.__doc__   
oder als Mehrzeiler machen. Dabei gilt:
- Der ganze Block mit 2x drei doppelten Anführungszeichen (""") eingerahmt
- Zusammenfassung: erste Zeile
- leere Zeile
- "Args" ohne Einrückung
-   eingerückt: für jedes Argument (und dessen akzeptierten Datentypen) eine eigene Zeile
- "Returns" ohne Einrückung
-   eingerückt: für jede Return-Option Erläuterungen - Datentyp + Beschreibung
## Context Manager
Ein Kontext-Manager
1. setzt den Kontext für folgenden Code
2. führt Code aus
3. entfernt den Kontext.

Beispiel mit optionalem ```as```: Objekt, das der Kontext-Manager zur weiteren Verwendung erstellt
    with open('file.txt) as file
Struktur eines Kontext-Managers:

    @contextlib.contextmanager
    def my_context():
        # Code zum Aufsetzen des Kontext
        yield
        # Code zum Entfernen des Kontext
        @contextlib.contextmanager

Beispiel: timer()
    # Add a decorator that will make timer() a context manager
    @contextlib.contextmanager
    def timer():
      """Time the execution of a context block.

      Yields:
        None
      """
      start = time.time()
      # Send control back to the context block
      yield
      end = time.time()
      print('Elapsed: {:.2f}s'.format(end - start))
    
    with timer():
      print('This should take approximately 0.25 seconds')
      time.sleep(0.25)

## Lambda Funktionen
Mit  ```lambda argument(s): expression``` kann man einfache oder auch "anonyme" Funktionen erstellen, die weder eine "def"-Zeile noch eine "Return"-Anweisung benötigen.
### mit einem Argument (Einzelwert): 
```(lambda x: x*1.2, 25)``` 
### mit einem Argument (Liste): 
```(lambda x: sum(x) / len(x),[3,6,9])``` 
### mit zwei Argumenten: 
```(lambda x,y: x**y, [2,3])```
### mit Iterables
```
names=["Thomas","Sabine", "Maya", "Finja"]
capitalize=map(lambda x: x.capitalize(), names) #erzeugt ein map-Objekt
list(capitalize)
```

### Beispiel: auf DataFrame-Spalte filtern und als Liste "result" ausgeben
result = filter(lambda x: x[0:2]=="RT" , tweets_df['text'])

### mit reduce (auf EINEN Rückgabewert verdichten)
from functools import reduce  
liste = ['a', 'e', 'i', 'o', 'u']
result = reduce(lambda item1,item2: item1+item2, liste)

### Testing mit assert
Erfolgreiche Tests wie ```assert 1+1 == 2 ``` geben keine Rückmeldung. Gescheiterte Tests wie ```assert 1+1 == 3``` ergeben "AssertionError".

# matplotlib
import matplotlib.pyplot as plt
## Histogramme
Für DataFrames: df["col"].hist(bins=i, alpha=1)   alpha: durchsichtig - bei übereinandergelegten Plots   
```df["col"].hist(bins=np.arange(59,93,2), alpha=1)``` erzeugt bins in Zweier-Schritten von 59 bis 93(exklusiv)  
Für Numpy-Arrays: ```plt.hist(np.array, bins=np.arange(<min>, <max(exklusiv)>, <binwidth>))
danach immer: ```plot.show()```
## Barplot
df.plot(kind="bar", title="A Title")
## Lineplot
df.plot(x="col1", y="col2", kind="line", rot=45)  (rot: Rotation 45% für x-Beschriftung)
## Scatterplot
df.plot(x="col1", y="col2", kind="scatter")


plt.legend(["val1", "val2"])
-- DANACH: immer 
plt.show()

# Plotten mit seaborn
Geht NUR mit matplotlib!! Danach: ```import seaborn as sns```. Beispiel für Histogramm: 
## Histplot: Anzahl von Vorkommen von (x)
sns.histplot(data=df, x='<col>',binwidth=1)
## Alternative: Countplot 
sns.countplot(data=df, x="col")
## Boxplot: Spread von (y) je (x)
sns.boxplot(data=df, x='<col1>',y='<col2>')
## Barplot: Durchschnitt (y) pro Kategorie (x) + 95% Konfidenz-Intervall für den Durchschnitt 
sns.barplot(data=df, x='<col1>',y='<col2>')
## Heatmap: (lineare) Korrelationen sichtbar machen
sns.heatmap(df.corr(), annot=True)  
Greift NUR numerische Werte auf!
## Pairplot: Paarweise Korrelationen von Spalten
sns.pairplot(data=df, vars=["<optionale Liste der Spalten"])
## KDE (kernel density estimation):
sns.kdeplot(data=df, x="col", hue="col1", cut=0)
## catplots
sns.catplot(x="col", hue="col1", data=df, kind="box")
sns.catplot(x="col", y="col1", data=df, kind="bar")
sns.catplot(x="col", y="col1", data=df, kind="point", hue="col2", dodge=True/False, join=True/False)
sns.catplot(x="col", kind="count", col="facet split variable", col_wrap=<Anz. Plots pro Reihe>, palette=sns.color_palette("Set1"), data=df, hue="col1") http://seaborn.pydata.org/tutorial/color_palettes.html

sns.set(font_scale=0.1)
sns.set_style("whitegrid")

### Seaborn Plots anpassen mit matplotlib-Funktionen
Zuerst als ax-Objekt sichern - dann auf ax matplotlib-Funktionen anwenden
- Titel: ```ax.fig.suptitle("Mein Titel")```
- Achsen-Beschriftungen: ```ax.set_axis_labels("x-Achsen-Label","y-Achsen-Label")```
- Titel-Höhe: ```plt.subplots_adjust(top=0.9)```  

# Statistik in python
```import numpy as np```
```import statistics``` 
## Measures of center
Durchschnitt: ```np.mean()```
Median (50% der Stichprobe ist geringer): ```np.median()```
Mode(der am häufigsten vorkommende Wert): ```statistics.mode()```
## Measures of spread
Varianz: ```np.var(df["col1"], ddof=1)``` (ddof:1 - bei Stichprobe; bei Gesamt-Population: WEGLASSEN)  
Standard-Abweichung (standard deviation(SD)): ```np.std(df["col1"], dd0f=1 )```  (ddof:1 - bei Stichprobe; bei Gesamt-Population: WEGLASSEN)  
Quantile: 25% Quantile ```np.quantile(df['col1'], 0.25])``` oder ```df["col1"].quantile(0.25)```  
Quartiles: ```np.quantile(df['col1'],[0, 0.25,0.5,0.75,1])``` oder ```np.quantile(df['col1'],np.linspace(0,1,5))```
Interquartile Range (IQR): Entfernung zwischen 25% und 75% Percentile. ```from scipy.stats import iqr
iqr(df['col1'])```   
Standard-Outlier: kleiner as 1.5 * IQR - 25 Quantil ODER größer als 1.5 * IQR + 75 Quantil  
Alle auf einmal: ```df['col1'].describe()``` 
## Outliers
Zur Beschreibung von Outliern/Ausreißern kann man folgende Maße nehmen:
### Leverage
Gibt an, wie "extrem" die Werte explanatorischen/unabhängigen Variable sind. Bei der Modell-Erstellung kann man den Wert für Leverate aus der Zusammenfassung ```z = model.get_influence().summary_frame()``` über den Wert ```z["hat_diag"]``` herausziehen. 
### Influence
Gibt für jeden Messpunkt an, wie sehr sich das Vorhersage-Modell ändern würde, wenn man ihn bei der Modell-Erstellung weglassen würde. Der Wert für Influence wird als Cooks Distanz bezeichnet ```z["cooks_d"]```

## Stichproben
### Sampling
Sample ```df['col'].sample(<Anzahl>, replace=True|False)```. Alternative für Anzahl; Für <Anzahl>: ```df['col'].sample(frac=0.1)``` mit Anteil "frac" der Population. Für Reproduzierbarkeit: ```np.random.seed(<integer>)``` setzen (oder Sample mit Parameter , random_state=<Seed integer>) aufrufen.  
Alternative Zufalls-Erzeuger 
|Normalverteilung)|```random.normal(loc=2, scale=1.5, size= 100)```| mit loc = mean und scale = Standard-Abweichung|
|Gleichverteillung|random.uniform(low=i, high=i,size=x)|mit Ober- und Untergrenze und Größe|  

Durchschnitt eines zufälligen Wurfs von 4 Würfeln: ```np.random.choice(list(range(1,7)), size=4, replace=True).mean()```.  


Vorgehen für systematisches Sampling (jede x-tes Vorkommen testen): 
``` 
sample_size = i
population_size = p
interval=population_size//sample_size
df.iloc[::interval] # Jeden Sample aus den konkreten Index im Interval-Arrays holen 
```

### Bootstrapping
Ein Sample (mit Replacement) in der Größe des Original-Samples erstellen, um sich durch Kombination mehrerer Bootstrap-Samples der realen Population zu nähern. Bootstrap verbessert nicht den Durchschnitt eines Samples, gibt aber eine bessere Annäherung an die Standard-Abweichung der Population.

Code:
    import numpy as np
    mean_x=[]
    for i in range(x):
        mean_x.append(
            np.mean(orig_sample.sample(frac=1, replace=True)['attrib'])   
        )   
    bootstrap_distn=mean_x   

### Uniforme Distribution
```from scipy.stats import uniform```  
Wahrscheinlichkeit, dass man bis zum Zielwert kommt: ```uniform.cdf(7,0,12)```(<Zielwert>, <Untere Grenze>, <Obere Grenze>). Mit ```uniform.rvs(0, 5, size=10)``` bekommt man ein Sample von 10 aus dem Intervall 0 bis 5 aus der uniformen Verteilung.
### binomial Verteilung
```from scipy.stats import binom```   
Mit binom.rvs(#Würfe, Wahrscheinlichkeit Erfolg, size=# Versuche) erzeugt man ein Sample-Array für 8 Würfe einer Münze mit 50% Wahrscheinlichkeit für "Kopf"  ```binom.rvs(1, 0.5, size=8)```.  
Mit ```binom.pmf(7,10,0.5)``` bekommt man die Wahrscheinlichkeit, 7* Erfolg bei 10 Versuchen bei einer Wahrscheinlichkeit von 50% zu erhalten. ```binom.cdf(7,10,0.5)``` gibt die Wahrscheinlichkeit, bei 10 Würfen und einer Wahrscheinlichkeit von 50% mindestens 7* Erfolg zu haben.
### Normalverteilung
```from scipy.stats import norm```  
Wieviel Prozent liegen unter dem Zielwert? ```norm.cdf(Zielwert, Durchschnitt, Standard-Abweichung)```  
Bei welchem Wert liegen 90% unter dem Zielwert? ```norm.ppf(Prozent(Dezimalschreibweise), Durchschnitt, Standard-Abweichung)```  
Zufallszahlen mit der Normalverteilung generieren ```norm.rvs(Durchschnitt, Standard-Abweichung, size=10)``` size: Sample-Größe  

### Poissonverteilung
Beschreibt die Wahrscheinlichkeit einer bestimmten Anzahl von Ereignissen innerhalb einer definierten Zeit-Periode.
```from scipy.stats import poisson```  
Was ist die Wahrscheinlichkeit von x Ereignissen innerhalb einer Zeitperiode bei Erwartungswert LAMBDA für die Zeitperiode? ```poisson.pmf(x,LAMBDA)```. Was ist die Wahrscheinlichkeit, dass x oder weniger Ereignisse in einer Periode auftreten? ```poisson.cdf(x,LAMBDA)```. Samples können mit ```poisson.rvs(LAMBDA, size=y)``` erzeugt werden.
### Exponentionalverteilung
```from scipy.stats import expon```   
Wie lange dauert es (beliebige Zeiteinheit) zwischen zwei Ereignissen? Wie hoch ist die Wahrscheinlichkeit bei  (Erwartungswert (LAMBDA) Wartezeit: 2 min), dass man EINE Minute wartet? Scale ist immer 1/LAMBDA ```expon.cdf(1, scale=2)```.  

### Korrelation
Die Pearsson Produkt-Moment-Korrelation: ```df['col1'].corr(df['col2'])``` ist NUR für lineare Beziehungen geeignet. Ggf. hilft es, die LOG-Werte zu vergleichen. Zur Umwandlung kann man ```np.log(df['col'])``` verwenden.

### Gold Standard bei Experimenten
1. Zufällige Zuweisung zu Treatment/Control Group (macht Gruppen "vergleichbar")
2. Placebo statt Treatment nehmen
3. Double Blind Versuch (auch der Versuchsleiter weiß nicht, ob der Proband Placebo oder Treatment bekommt)

## Regressionsmodelle
### Lineare Regression und Vorhersagen
    # ols = ordinary least squares
    from statsmodels.formula.api import ols
    import numpy as np

    model = ols("y ~x",  # Formel
                data = dataset
            ).fit()

    print(model.params)  # ergibt intercept und Steigung

    # Vorhersagen vorbereiten
    explanatory_data = pd.DataFrame({'x': np.arange(0, 11)})
    prediction = model.predict(explanatory_data)
    
    # Dataframe mit Vorhersagen erzeugen
    predictions = explanatory_data.assign(prediction = model.predict(explanatory_data))
### Logistische Regression
Logistische Regression muss angewendet werden, wenn die Reponse-Variable logisch ist (0 oder 1).

    from statsmodels.formula.api import logit
    import numpy as np

    model = logit("y ~x",  # Formel
                data = dataset
            ).fit()
### Confusion matrix, accuracy, sensitivity, specificity

TN = True Negative ```conf_matrix[0,0]```  
TP = True Positive ```conf_matrix[1,1]```  
FN = False Negative ```conf_matrix[1,0]```   Type I Error (reject a true null hypothesis)   
TN = False Negative ```conf_matrix[0,1]```   Type II Error (failing to reject a false null hypothesis)     

Accuracy: Anteil der korrekten Vorhersagen (TN + TP) / (TN+FN+TP+FP)
Sensitivity: Anteil der richtig erkannten Trues (TP) / (TP + FN)
Specificity: Anteil der richtig erkannten Falses (TN) / (FP +  TN) 

Alpha: beschreibt die Wahrscheinlichkeit eines Type I Errors

# Machine learning

## Supervised Learning
Voraussetzung: Numpy-Arrays - OHNE NA-Werte

### Linear Regression
    # X: Features/independent variables    
    # y: Target/Predictor/dependent variable 
    # Import the module
    from sklearn.linear_model import LinearRegression

    reg = LinearRegression() # instantiate the model
    reg.fit(X, y)
    predictions = reg.predict(X)

### Categorical data: Beispiel KNN (k-nearest neighbors)
    
    # X: Features/independent variables    
    # y: Target/Predictor/dependent variable 
    
    # Import the module
    from sklearn.model_selection import train_test_split

    # Split into training and test sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)
    knn = KNeighborsClassifier(n_neighbors=5)

    # Fit the classifier to the training data
    knn.fit(X_train, y_train)

    # Print the accuracy
    print(knn.score(X_test, y_test))

## Workflow Bewertung Klassifikationsmodelle
    import matplotlib.pyplot from numpy
    from sklearn.preprocessing import StandardScaler
    from sklearn.model_selection import cross_val_score, KFold, train_test_split
    from sklearn.neighbors import KNeighborsClassifier
    from sklearn.linear_model import LogisticRegression
    from sklearn.tree import DecisionTreeClassifier

    X = music.drop("genre", axis=1).values # Attribute/Predictors/Features
    y = music["genre"].values # Target
    X_train, y_train, X_test, y_test = train_test_split(X, y, random_state = 42)
    scaler = StandardScaler()
    X_train_scaled = scaler.fit_transform(X_train)
    X_test_scaled = scaler.transform(X_test)
    # dictionary mit zu testenden Models erstellen
    models = {"Logistic Regression":LogisticRegression(), "KNN": KNeighborsClassifier(), "Decision Tree": DecisionTreeClassifier()}
    results = [] # leere Liste
    for model in models.values():
        kf = KFold(n_splits=6, random_state = 42, shuffle=True)
        cv_results = cross_val_score(model, X_train_scaled, y_train, cv=kf)
        results.append(cv_results)
    plt.boxplot(results, labels=models.keys())
    plt.show()

    # Test-Set Performance 
    for name, model in models.item()
        model.fit(X_train_scaled, y_train)
        test_score = model.score(X_test_scaled, y_test)
        print("{} Test Set Accuracy: {}".format(name, test_score))

# OpenAI und Python
## completion request
from openai import OpenAI
client = OpenAI(api_key="ENTER YOUR KEY HERE")
response = client.chat.completions.create(
    model = "gpt-4o-mini",
    messages = [{"role":"user", "content":"<Frage>"}]
)
print(response) => ChatCompletion-Objekt  
print(response.choices[]) => Choice-Objekt   
print(response.choices[].message) => ChatCompletionMessage-Objekt  
print(response.choices[0].message.content) => die "reine" Antwort as String.
## moderation request
response = client.moderations.create(
    model = "text-moderation-latest",
    input = "I could kill for hamburgers"
)
print(response.model_dump)  
print(response.results[0].category_scores)
## speech to text (whisper)
audio_file = open("meeting_recording_xxx.mp3", "rb")

response = client.audio.transcriptions.create(model="whisper-1", file = audio_file)

print(response.text)
## translate speech (whisper) - to english only
audio_file = open("non_english.mp3", "rb")

prompt = "The transcript is about AI trends and ChatGPT"

response = client.audio.translations.create(model="whisper-1", file = audio_file, prompt=prompt)

print(response.text)

## model chaining (Beispiel: Meeting Teilnehmer extrahieren)
audio_file = open("meeting.mp3", "rb")
audio_response = client.audio.transcriptions.create(model="whisper-1", file = audio_file)

transcript=audio_response.text
prompt = "Extract the attendee names from the start of this meeting transcript: " + transcript

response = client.chat.completions.create(
    model = "gpt-4o-mini",
    messages = [{"role":"user", "content": prompt}]
)
print(response.choices[0].message.content)
