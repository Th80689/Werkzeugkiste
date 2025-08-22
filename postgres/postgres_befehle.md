# Übersicht über nützliche PostgreSQL-Befehle

Andere Beispiele für den Einstieg: 
- https://neon.tech/postgresql/tutorial
## Datenbank anlegen
```CREATE DATABASE <db_name>;```
```GRANT ALL PRIVILEGES ON DATABASE <db_name> TO <user_name>```  
### Schemas 
Default-Schema ist immer ```public```.
Syntax ist ```CREATE SCHEMA <schema_name>```. Namensregeln sind a) max. 31 Zeichen b) Startet mit Buchstabe oder "_", c) darf nicht mit 'pq_' beginnen. Der Zugriff auf das Schema kann mit ```GRANT USAGE ON SCHEMA <schema_name> TO <user_name>``` gegeben werden.

## CREATE Tables

### Datentypen

|Bereich|Typ|Details|
|-|-|-|
|Zahlen|SMALLINT|-32768 bis 32767|
||INTEGER|-2147483648 bis 2147483647|
||BIGINT|-9223372036954775808 bis 9223372036954775807|
||SERIAL|auto-incrementing, 1 bis 2147483647|
||BIGSERIAL|auto-incrementing, 1 bis 9223372036954775807|
||DECIMAL(p,s)|precision: Anzahl der Ziffern VOR dem Komma, scale: Davon Nachkomma-Stellen; max. 131072 Ziffern VOR dem Komma, max. 16383 NACH dem Komma|
||NUMERIC(p,s)||
||REAL|6 Ziffern precision|
||DOUBLE PRECISION|15 Ziffern precision|
|Text|TEXT|unbegrenzt|
||VARCHAR|variable Länge mit optionalem MAX (n) Zeichen|
||CHAR|genau n Stellen, mit Leerzeichen rechts aufgefüllt|
|Boolean|true oder false||
|Zeit|TIMESTAMP|YYYY-MM-DD hh24:mi:ss|
||DATE|YYYY-MM-DD|
||TIME|hh24:mi:ss|

## Tabelle anlegen  
```CREATE TABLE x (column_name NOT NULL);```  

## Spalten anlegen
```ALTER TABLE test ALTER COLUMN x TYPE INTEGER [SET|DROP] NOT NULL```  

## Unique constraints
```ALTER TABLE x ADD CONSTRAINT some_name UNIQUE(column_name);```

### Regular primary
```CREATE TABLE x (a integer PRIMARY KEY, b integer, c integer);```
### Primary nachträglich hinzufügen
```ALTER TABLE x ADD CONSTRAINT constraint_name PRIMARY KEY (a));```
### Composite primary
```CREATE TABLE x (a integer, b integer, c integer, PRIMARY KEY (a,c))```

### Surrogate key Konstrukt mit Datentyp "serial" (Integer aufsteigend)
```ALTER TABLE x ADD COLUMN id serial PRIMARY KEYs;```
### Foreign Key
```CREATE TABLE x (a integer, b integer, c integer REFERENCES table_y (y_key) [ON DELETE [CASCADE|NO ACTION|RESTRICT|SET NULL|SET DEFAULT])```

```ALTER TABLE x ADD CONSTRAINT a_fkey FOREIGN KEY (b_id) REFERENCES b```

### Check Constraints
```ALTER TABLE x ADD CHECK (<col> > 0);```

## Typ-Änderung mit USING
```ALTER TABLE test ALTER COLUMN x TYPE INTEGER USING <expression>```  
### Beispiele für Expressions
```ROUND(average_grade)```     
```SUBSTRING(x FROM 1 FOR x)```

## Indexes
```CREATE INDEX [CONCURRENTLY] <index_name> ON <table_name>(<column(s)>)```.
CONCURRENTLY: Daten können geladen werden, auch wenn die Tabelle gerade geladen wird.

## User-Verwaltung und PRIVILEGEs
Jede Postgres-Datenbank hat den Superuser ```postgres```, der u.a. Datenbanken anlegen (CREATE db) und Löschen (DROP db) kann.
Ein neuer User wird mit ```CREATE USER <user_name>'``` angelegt, der dann ein eigenes Schema erhält. Danach hat der User aber noch kein Passwort. ```CREATE USER <user_name>  WITH LOGIN PASSWORD '<secret>'``` behoben werden. Der User kann das wieder ändern mit ```ALTER USER <user_name> WITH PASSWORD '<new_secret>'```.  
Usern und Rollen können Detail-Rechte (privileges) wie SELECT, INSERT, UPDATE, DELETE mit der Syntax ```GRANT <privilege> ON <object> TO <grantee = user/role>``` zugewiesen werden.
DDLs darf immer nur der OWNER durchführen. Diese Eigentümerschaft kann aber auch mit ```ALTER TABLE <table_name> OWNER TO <new owner>``` geändert werden. Das kann auch auf Schema-Ebene mit ```GRANT INSERT, UPDATE, DELETE, SELECT ON ALL TABLES IN SCHEMA <schema_name> TO <user_name>``` geschehen.  
Neben Usern können auch Gruppen angelegt werden ```CREATE GROUP <group_name>```. Diese können dann über ```GRANT USAGE ON SCHEMA <schema_name> TO <group_name>``` und ```GRANT INSERT, UPDATE, SELECT, DELETE ON ALL TABLES IN SCHEMA <schema_name> TO <group_name>``` mit allen Rechten versehen werden. Danach können dann alle Nutzer, die der neuen Gruppe mit ```ALTER GROUP <group_name> ADD USER <user_name>``` zugewiesen werden über diese Gruppenrechte zugreifen. Erhöhte Stufe ist: ```GRANT ALL PRIVILEGES ON <schema_name>.* TO <user_name>```.
Das Gegenstück zum ```GRANT``` ist ```REVOKE ALL PRIVILEGES FROM <user_name/role>``` - bzw. bei einer Gruppe ```REVOKE <group_name> FROM <user_name>```.

## Arrays abfragen

select array_col[x] ... x-tes Element aus Array abfragen (erstes Element: 1)
... where any(array_col) =  alle Element aus Array abfragen
## Normalformen

|NF|Bedingungen|Erläuterungen|
|-|-|-|
|1. NF|Tabellen-Werte sind atomar|1 Attribut = EIN Datenobjekt|
|2. NF|1. NF + alle Nicht-Schlüssel-Attribute hängen vom Primary Key ab||
|3. NF|1. + 2. NF + keine transitiven Abhängigkeiten|alle Nicht-Schlüssel-Attribute hängen AUSSCHLIESSLICH vom Primary Key ab und haben untereinander keine Abhängigkeiten|


## CAST
Typenumwandlung geht über ```CAST(<Ausgangs-Attribut> AS <NEUER_TYP>)``` oder über die Syntax ```<Ausgangs-Attribut>::<NEUER_TYP>```. Beispiel: ```zahl::INTEGER```.

Bei der Daten-Aufbereitung hilft ```split_part(<string>,<delimiter>, <field_number>)``` 

https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-cast/

## Expression-Vergleich:
```<attribut>~E'^\\d+$'```

---- POSTGREsql ----
## Temporäre Tabellen
Für die Anlage von temporären Tabellen (bleiben nur über die Dauer einer Session erhalten) gibt es zwei Syntax-Varianten.
```CREATE TEMP TABLE tab_name AS SELECT ...``` (empfohlen von PostgreSQL) oder ```SELECT ... INTO TEMP TABLE tab_name FROM ...```. Diese temporären Tabellen können mit ```DROP TABLE tab_name``` einfach gelöscht werden. Um Fehlermeldung bei Nicht-Vorhandensein zu vermeiden kann man das Kommando auch mit ```DROP TABLE IF EXISTS tab_name ``` absichern.

Mit ```ANALYZE <table_name>``` kann man für folgende Abfragen die Performanz verbessern. Die Datenbank speichert die Statistiken in ```pg_statistics```.

Mit ```EXPLAIN``` vor der Query kann man den Execution Plan anschauen. Mit der Option ```EXPLAIN ANALYZE``` gibt es mehr Infos - u.a. Planning Time und Execution Time. 

## Binning
Mit ```GENERATE_SERIES(<from>,<to>,<step - Einheit>)``` erzeugt man Serien. Beispiel: 
```SELECT generate_series(1,1.3,0.1);``` erzeugt 1 1.1 1.2 1.3.  
Als Einheit kann man auch INTERVALs mitgeben. ```generate_series('2024-01-01','2025-01-01', '2 months'::interval)``` gibt 6 Einträge mit 2-Monats-Differenzen aus.


Per WITH-Clause kann man so Bins erzeugen:   
```WITH bins as (
    SELECT generate_series(1,5,1) as lower,
           generate_series(2,6,1) as upper) 
```

## Verteilungen
Durchschnitt (average / mean) erhält man mit ```avg(<a1>)```, die Standard-Abweichung mit ```stddev(<a1>)```.
Korrelationen zwischen zwei numerischen Attributen bekommt man mit ```corr(<a1>, <a2>)```.  
Diskrete Perzentil-Werte bekommt man mit  ```percentile_disc(<percentile>) WITHIN GROUP (ORDER BY column_name)```. Kontinuierliche (interpolierte) Werte bekommt man mit ```percentile_cont(<percentile>) WITHIN GROUP (ORDER BY column_name)```.

## Text-Verarbeitung

Groß/Klein kann man bei Vergleichen mit ``` ILIKE '%asc%'``` ignorieren.
Mit ```trim('<input>','<Liste zu eliminierender Zeichen>')``` kann man Text bereinigen.

Mit ```initcap()``` wird der erste Buchstabe GROSS, der Rest klein normiert.

Mit ```left(<input>,n)``` bzw. ```right(<input>,n)``` bekommt man die linken oder rechten n Zeichen eines Strings. Mit ```substring(<input> FROM start FOR length)``` bekommt man Teilstrings. In Kurzfrom ```substr(<input>, start,length)```. Teilen kann man Text mit ```split_part(<input>,delimiter [,part to return])```. ```select split_part('a,bc,d',',',2)``` würde also ```bc``` (den zweiten Teil) ausgeben. Zusammenfügen geht mit ```SELECT concat('a','bc','de');``` ergibt also ```abcde```. Das gleiche geht aber auch mit Pipe: ```SELECT 'a'||'bc'||'de';```. Der einzige Unterschied: ```concat``` überspringt NULL Werte und zieht die vorhandenen Werte zusammen. Bei || ist NULL "ansteckend" - die Rückgabe ist dann komplett NULL.

## Zeit-Elemente extrahieren
Es gibt zwei Grund-Möglichkeiten: ```date_part('field', <Zeit-Wert>)``` und ```EXTRACT(FIELD from <Zeit-Wert>)```. Beide Varianten setzen definierte "FIELD"-Werte voraus:
|FIELD|Wert|Beispiel aus 2019-03-31 |
|-|-|-|
|century|Jahrhundert|century 21|
|decade|Dekade|decade 201|
|year, month, day|||
|hour, minute, second|||
|week|||
|dow|Tag der Woche|So=0, ..., Sa = 6|

Mit ```date_trunc('field',<Zeit-Wert>)``` kann man auf einen bestimmten Zeitwert reduzieren. Beispiel: beim Datum 31.3.2024 13:00 CET ergibt ```SELECT date_trunc('month', now())``` '2024-03-01 00:00:00+01'.  
Mit ```to_char('field',<Zeit-Wert>)``` bekommt man die textuelle Beschreibung der Zeit-Einheit (z.B. bei DOW den Wochentag).
Tipp: Mit ```SELECT to_char( now(), 'Month')``` bekommt man den Monatsnamen - nicht die Zahl. 

## Sonstiges

Datentyp ermitteln: pg_typeof(<Spalte>)

COALESCE(x,x,x) -- NULL-Werte wie DECODE behandeln

NTILE(<Anzahl pages>) -- paging

MEDIAN berechnen:  PERCENTILE_CONT(0.5)

----Pivoting ----

CREATE EXTENSION IF NOT EXISTS tablefunc;

```SELECT * FROM CROSSTAB($$
  SELECT
    Country, Year, COUNT(1) :: INTEGER AS awards
  FROM Summer_Medals
  WHERE
    country IN ('CHN','RUS','USA')
                AND year in (2008,2012')
                AND medal ='Gold'
  GROUP BY country, year
  ORDER BY country ASC, year ASC
$$) AS ct (Country VARCHAR, "2008" INTEGER, "2012" INTEGER)
ORDER BY country ASC;
```
-- ROLLUP: GROUP BY subclause with extra rows for group-level aggregations
-- hierarchical, deaggregating from the leftmost provided column to the right-most

SELECT
  country, medal, COUNT(*) AS awards
FROM summer_medals
WHERE year = 2008 AND country IN ('CHN','RUS')
GROUP BY ROLLUP(Country, medal)
ORDER BY country ASC, medal ASC;

-- CUBE: non-hierarchical ROLLUP
-- generates all possible group-level aggregations

SELECT
  country, medal, COUNT(*) AS awards
FROM summer_medals
WHERE year = 2008 AND country IN ('CHN','RUS')
GROUP BY CUBE(Country, medal)
ORDER BY country ASC, medal ASC;
 
-- STRING_AGG(column, separator)

---- Windows
...  ROWS BETWEEN [n | UNBOUNDED] PRECEDING  AND  [CURRENT ROW | n | UNBOUNDED] FOLLOWING

## Meta-Informationen

### Tabellen erkunden
Strukturelle Infos gibt es per 
```select table_schema, table_name from information_schema.tables```
|Objekt-Typen|
|-|
|tables|
|table_constraints|
|columns|

Anstatt über das Schema kann man auch über ```pg_<Objekt>```-Views gehen - z.B.:
|Objekte|
|-|
|pg_indexes|
