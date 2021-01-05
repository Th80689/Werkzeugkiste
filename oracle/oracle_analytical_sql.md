# Oracle Analytical SQL

Ich will hier etwas herumspielen, um ein Gefühl für die "analytischen" Funktionen zu bekommen
- [ ] listagg
- [ ] CONNECT BY
- [ ] 

## `CONNECT BY` - Hierarchische Abfragen
Hierarchische Strukturen über Self-Join einer Tabelle aufbauen
Beispiele in CONNECT_BY_examples.sql: 
*Zahlenreihe von 1-9 erzeugen*
`select level from dual connect by level <10;` 

