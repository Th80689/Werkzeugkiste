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
|Arithmetic|//|Floor Division|Quotient mit gerundeter Ganzzahl|
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

Beispiel 3: if in Bedingung ```[num**2 for num in range(10) if num % 2 == 0]```

Beispiel 4: If/else im Output ```[member if len(member) >= 7 else '' for member in fellowship]````

In "allgemeiner Form" also: [output expression + conditional on output for iterator variable in iterable if conditional on iterable] 

Beispiel 5: Negative Zahlen von 0 bis 8 als Dictionary ```neg_dict={num: -num for num in range(9)}```

## Generator objects
Syntax: statt [] wie bei List comprehension werden () verwendet. Das Ergebnis wird NICHT als Liste im Arbeitsspeicher gehalten - sondern dient nur zur Iteration. Das kann helfen, wenn GROSSE Listen verarbeitet werden müssen und Arbeitsspeicher knapp wird. Beispiel: ()

## Generator function
file: sequence.py
def num_sequence(n):
    """Generate values from 0 to n."""
    i = 0
    while i < n:
        yield i
        i += 1

## Batch-Verarbeitung: 10 Datensätze pro Batch
'# Import the pandas package
import pandas as pd

'# Initialize reader object: df_reader
df_reader = pd.read_csv('ind_pop.csv', chunksize=10)

'# Print two chunks
print(next(df_reader))
print(next(df_reader))


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

Erzeugen: mit pd.DataFrame(<list>, <dict>)
1. List of dicts: l = [{"key1":"val1", "key2":"val2"},{"key1":"val1a", "key2":"val2a"} ]
2. Dicts of lists d={"key1":["val1","val1a"], key2:["val2","val2a"]}

|Methode/Funktion|Ergebnis|Beschreibung|
|-|-|-|
|pd.DataFrame([dict|list|array])|DataFrame|Erstellt aus Input einen DataFrame (tabellarische Struktur)|
|pd.read_csv(<path/filename>[, chunksize=i], index_col=['coli])|DataFrame|Liest ein csv-File in einen DataFrame ein|
|pd.to_csv(<path/filename>)|File|erstellt ein csv-File aus einem DataFrame|
|df.head()|DataFrame|zeigt die ersten 5 Zeilen eines df|
|df["attrib"].mean()|<value>|Durchschnittswert eines (numerischen) Attributs|
|df["attrib"].sum()|<value>|Summe eines (numerischen) Attributs|
|df["attrib"].to_numeric()|<value>|Spaltenwert in Zahl umwandeln|
|df.head()|erste Zeilen anzeigen||
|df.info()||Zeigt Spalten-Namen an|
|df.shape|(Anzahl Zeilen, Anzahl Spalten|Struktur |
|df.describe()|Tabelle|Zusammenfassungen/Statistiken|
|df.values|Array|Eine Liste aller Rows (wiederum als einzel-Liste|
|df.columns|Liste|Liste aller Spalten-Namen|
|df.index|RangeIndex|Beschreibung Index mit start, stop, Schrittweite|
|df.sort_values(["Col_name", "Col2", ...] [, ascending=False])|Tabelle|Sortierte Ausgabe Reihen|
|df[["Col1", "Col2"]]|Tabelle|Spalten auswählen|
|df["Col1"].isin(["Val1","Val2"])|Logischer Filter-Vektor|Alle Zeilen-IDs, die einer der Ausprägungen entsprechen|
|df.drop_duplicates(subset=['col1','col2'])|df ohne Duplikate|Duplikatserkennung anhand der Liste der Attribute|
|df['Gruppierungsspalte'].value_counts(sort=True|normalize=True)|Serial|Anzahl sortiert|%-Anteil)|
|df.groupby('Gruppierungsspalte')['<Messspalte>'].agg([min, max, sum, {'col_name':'count'}])|Aggregate||
|df.pivot_table(values='Aggregat-Wert', index='Gruppierung', columns='Spalten')|Tabelle|Optionen: aggfunc=[np.func], columns = <weiterer Agg-Level>, fill_value = 0 (0 statt NaN bei leeren Werten), margins=True (Durchschnitte bei Spalten und Zeilen|
|df.set_index("Col1")|Ändert "Col1" in Index|Wert statt 0 - n; kann auch mehrere Spalten in einer Liste enthalten|
|df.reset_index()|Index Reset|Macht aus Index wieder eine Spalte; Option zum Löschen: drop=True|
|df.loc[['Index-Wert'],['Spaltenwert] ]|Subset|kann auch mit [Liste von Indezes] angesprochen werden; bei Slices ist der letzte Wert ENTHALTEN!|
|df.iloc[[r1:rx],[c1:cn]]|Subset|mit Integer-Werten (oder Slices) selektieren|
|df.sort_index()|sortierter df|Optionen: Listen mit level=["col1", "col2"], ascending=[True, False]|
|df['col2'].dt.year|Jahr aus Datum|Datumswerte extrahieren|

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

## pandas: Filter Joins
SEMI JOIN: Filter-Vektor: Nur col's von LINKS, die in RECHTS sind, keine Duplikate ```df['col1'].isin(df2['col1'])```   
ANTI JOIN: Nur col's von LINKS, die NICHT in RECHTS sind
1. df mit _merge erstellen: ```base=df['col1'].merge(df2, on='col1', how='left', indicator=True)```
2. Filter-Vektor erstellen: ```f=base.loc[base['_merge'] == 'left_only', 'col1']]```
3. Filter anwenden: ```base[base['col1'].isin(f)]```

## pandas: Concatenation
Basis: ```pd.concat([df1, df2, ...])```. Option  ```ignore_index=True``` verwirft die Indize der Ursprungs-DFs. Mit ```keys=['label_df1','label_df2',...]``` können Labels im Index ergänzt werden. Mit ```join='inner'``` werden nur Spalten genommen, die in ALLEN Tabellen vorhanden sind. Ohne diese Option werden Spalten, die in einigen DFs fehlen mit NaN gefüllt.
Die Option ```verify_integrity=True``` verhindert die Entstehung von Duplikaten im Index und wirft einen 'Value Error'.

## Missing values finden
df.isna() : pro Wert ausgeben
df.isna().any() : Info pro Spalte, ob mindestens ein Wert fehlt - oder nicht
df.isna().sum(): Anzahl der fehlenden Werte

df.dropna(): Zeilen, die mindestens ein na haben löschen
df.fillna(0): füllt leere Werte mit 0


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

# matplotlib
import matplotlib as plt
## Histogramm
df["col"].hist(bins=i, alpha=1)   alpha: durchsichtig - bei übereinandergelegten Plots 
## Barplot
df.plot(kind="bar", title="A Title")
## Lineplot
df.plot(x="col1", y="col2", kind="line", rot=45)  (rot: Rotation 45% für x-Beschriftung)
## Scatterplot
df.plot(x="col1", y="col2", kind="scatter")


plt.legend(["val1", "val2"])
-- DANACH: immer 
plt.show()
