# Oracle SQL Beispiele

Beispiele für "ungewöhnliche" SQL-Befehle  
- [x] LISTAGG
- [x] CONNECT BY
- [ ] TABLE 

## `CONNECT BY` - Hierarchische Abfragen
Hierarchische Strukturen über Self-Join einer Tabelle aufbauen  
Beispiele in [CONNECT_BY_Beispiele](CONNECT_BY_examples.sql):   
*Zahlenreihe von 1-9 erzeugen* `select level from dual connect by level <10`,    
*Abfragen in einer Hierarchie*   

## `LISTAGG` - Werte-Aggregation
Mit der Aggregat-Funktion LISTAGG können verschiedene Werte zu in einer Gruppe in einer Zelle mit Trennzeichen aufgeführt werden.  
Beispiele: [LISTAGG_Beispiele](LISTAGG_Beispiele.sql) 
