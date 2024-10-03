# Übersicht über nützliche PostgreSQL-Befehle

## CAST
Typenumwandlung geht über ```CAST(<Ausgangs-Attribut> AS <NEUER_TYP>)``` oder über die Syntax ```<Ausgangs-Attribut>::<NEUER_TYP>```. Beispiel: ```zahl::INTEGER```.
 

---- POSTGREsql ----
## Temporäre Tabellen
Für die Anlage von temporären Tabellen (bleiben nur über die Dauer einer Session erhalten) gibt es zwei Syntax-Varianten.
```CREATE TEMP TABLE tab_name AS SELECT ...``` (empfohlen von PostgreSQL) oder ```SELECT ... INTO TEMP TABLE tab_name FROM ...```. Diese temporären Tabellen können mit ```DROP TABLE tab_name``` einfach gelöscht werden. Um Fehlermeldung bei Nicht-Vorhandensein zu vermeiden kann man das Kommando auch mit ```DROP TABLE IF EXISTS tab_name ``` absichern.

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

## Sonstiges
COALESCE(x,x,x) -- NULL-Werte wie DECODE behandeln

NTILE(<Anzahl pages>) -- paging

 

----Pivoting ----

CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB($$
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

