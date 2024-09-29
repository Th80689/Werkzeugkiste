# Statistik - Grundbegriffe
## Zentral-Werte / Measures of center
|Maßzahl|(engl.)|Definition|Anwendung|
|-|-|-|-|
|Durchschnitt|mean|Summe aller Werte geteilt durch Anzahl der Messungen|gut geeignet für numerische Werte mit symmetrischer Verteilung|
|Median|median|Der "mittlere" Wert ist der Wert, an dem 50% aller Werte unterhalb der vom kleinsten bis größten Wert sortierten Werte liegt. Wenn das für zwei Werte gilt, wird der Durchschnitt der beiden Werte genommen|besser geeignet für numerische Werte mit asymmetrischer Verteilung (Outlier beeinflussen nicht so stark|
|Modus|mode|Der Wert, der am häufigsten vorkommt|geeignet für kategorische Werte|

## Verteilungsmaße / Measures of spread
||(engl.)|Definition|Vor- und Nachteile|
|-|-|-|-|
||range|Differenz zwischen kleinstem und größten Wert||
|Varianz|variance|Durchschnittlicher Abstand jedes Datenpunktes zum Durchschnitt|Damit sich negative und positive Differenzen einzelner Punkte nicht neutralisieren, werden die quadrierten Werte aufaddiert|
|Standard-Abweichung|standard deviation|Quadratwurzel der Varianz|Je näher die Zahl der 0 ist, desto näher liegen die Werte am Durchschnitt|
|Quartile|quartiles|Einteilung in 4 gleiche Teile (25/50/75/100)||
|IQR|inter quartile range|Distanz zwischen 1. und 3. Quartil|Ausreißer fallen hier nicht so sehr ins Gewicht|

## Wahrscheinlichkeits-Typen
### Unabhängige Wahrscheinlichkeiten
Der Eintritt eines Ereignisses beeinflusst nicht die Eintritts-Wahrscheinlichkeit des Folgeereignisses => Stichprobenziehung MIT Zurücklegen.

### Bedingte Wahrscheinlichkeiten / Conditional Probability
Der Eintritt eines Ereignisses BEEINFLUSST die Eintritts-Wahrscheinlichkeit des Folgeereignisses => Stichprobenziehung OHNE Zurücklegen.  
Beispiel: die Wahrscheinlichkeit, dass eine Bestellung über 150€ liegt (A), wenn die Bestellung aus der Kategorie "Küche" (B) ist.  
Die Wahrscheinlichkeit von A unter der Bedingung, dass B vorliegt, berechnet sich nach dem Muster:   
Anzahl der Ereignisse, für die (A UND B) gilt / Anzahl der Ereignisse für die (B) gilt. 

## Verteilungstypen
|Typ|Beschreibung|Beispiel|
|-|-|-|
|Diskrete Verteilung|Definierte Anzahl von Ergebnissen, Intervalle|Münzwürfe, Bestellungen zwischen 0 und 5 Euro, 5 und 10 Euro, ...|
|Diskrete gleichförmige Verteilung|Klare Ergebnisse, jedes Ereignis hat gleiche Wahrscheinlichkeit|Fairer Würfel|
|Kontinuierliche Verteilung|Wartezeiten auf einen Bus||
|Bimodale Verteilung|Verteilung mit zwei "Spitzen"||
|Binomische Verteilung|n-malige Wiederholung, zwei mögliche Ergebnisse, unabhängige Ereignisse mit gleicher Eintrittswahrscheinlichkeit|Wiederholter Münzwurf; Erwartungswert: n*p|
|Poisson-Verteilung|Die Durchschnitts-Anzahl von Ereignissen innerhalb einer Zeitperiode ist bekannt - aber Zeit und Abstand zwischen Vorkommen ist zufällig| Lambda: Erwartungswert (durchschnittliche Anzahl pro Zeiteinheit)|
|Normalverteilung|Glockenkurve; symmetrisch - die Fläche unter der Kurve ist 1, 68%/95%/99,7% sind innerhalb einer/zwei/drei Standard-Abweichung vom Durchschnitt||

### Skewness
- Positiv: Spitze ist "links", läuft nach rechts aus
- Negativ: Spitze ist "rechts"
### Kurtosis
Kurtosis beschreibt das Vorkommen von Extrem-Werten in der Verteilung.
- Positiv (leptokurtic): Hoher Gipfel rund um den Mittelwert, niedrigere Standard-Abweichung
- Normal (mesokurtic): Normaverteilung
- Negativ(platykurtic): Niedriger Gipfel, höhere Standardabweichung

Das "Gesetz der großen Zahlen" sagt: je mehr Ziehungen von Vorliegen, desto näher liegt die Verteilung der Stichprobe an der Verteilung der Grundgesamtheit.

## Central limit theorem (CLT)
Je mehr Stichproben man hat, desto mehr nähert sich die Verteilung an die Normalverteilung der tatsächlichen Population an. Das gilt aber nur unter der Bedingung, dass Stichproben zufällig und unabhängig voneinander gezogen werden - und es mindestens 30 Stichproben gibt. Das Theorem ist die theoretische Grundlage um von einer Stichprobe auf die Verteilung in der tatsächlichen Population zu schließen. 

## Hypothesis Testing
- Vergleichen von Populations

Besteht aus 
- NULL-Hypothese: es gibt KEINEN Unterschied zwischen zwei Gruppen
- Alternative Hypothese: es GIBT einen Unterschied - oder sogar einen GERICHTETEN Unterschied.

Vorgehen / Workflow:
1) Zielgruppen definieren (z.B. Erwachsene Frauen, die ENTWEDER Vitamin C zu sich nehmen - oder nicht)
2) NULL- und Alternativ-Hypothesen formulieren (z.B.: Vitamin C Einnahme hat KEINEN Effekt auf das Geschlecht von Kindern vs. Einnahme hat EINEN Effekt bzw. einen positiven/negativen Einfluss auf das Geschlecht)
3) Daten sammeln
4) Statistische Tests auf Stichproben durchführen
5) Schlussfolgerungen von Stichproben auf Gesamt-Populationen ausführen.

Einstufung der Variablen
|Szenario|Abhängig|Unabhängig|
|-|-|-|
|Hypothesen-Test|Alternativ-Hypothese erwartet Änderung|keine Änderungen (Kennzeichen der Population)|
|Experiment|Ergebnis (Response), z.B. Anzahl Käufe|Maßnahme (Treatment), z.B. WErbung|

## Correlation
Messung von Beziehungen  
Pearson Correlation Coefficient
- nur für lineare Beziehungen geeignet
- beschreibt die Beziehung von X zu Y in Werten von -1 (extreme negative) über 0 (KEINE) bis 1 (extreme positive) 

"correlation DOES NOT equal causation"