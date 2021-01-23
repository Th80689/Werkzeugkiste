# bash-Forschung

## Links
Tutorial: <http://www.gnu.org/software/bash/manual/bash.pdf>

## Wochenendaufgabe
- mehrere Muster als Variablen speichern
- Prozesse abrufen
- Muster suchen per Loop
a) Je Muster Ja(gefunden)/Nein(nicht da) ausgeben
b) Je Muster Output eine Zeile mit PID und zwei Varianten (AKTIV - nicht vorhanden)

#Pattern zuweisen
P1='263'
P2='/ps'
P3='NIX'
#Array bauen

ps | grep $P1 > test.txt
ps | grep $P2 >> test.txt

less test.txt

grep "Überschrift 1"  ||  "Überschrift 2" md-Markdown-Befehle.md