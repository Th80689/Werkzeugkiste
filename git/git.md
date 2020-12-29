#GIT - Versionsverwaltung
## Lokales GIT
### GIT konfigurieren
Nutzer-Name abfragen  ``git config --global user.name``  
Nutzer-Name eingeben  ``git config --global user.name <Vorname Nachname>``  
Nutzer-Email ``git config --global user.email <x@y.com>``  

### Ein Verzeichnis unter Versionskontrolle nehmen: 
1) in das Ziel-Verzeichnis wechseln ``cd <Zielverzeichnis>``  
2) Repository initialisieren (= Verzeichnis .git anlegen) ``git init``
3) Alles, was im Verzeichnis ist, unter Versionskontrolle (staging area / index) nehmen: ``git add .``
4) Alles aus dem Index in das Repository übernehmen: ``git commit``
4a) Schritte 3 und 4 können mit ``git commit -a`` abgekürzt werden 

### Unterschiede untersuchen
Unterschiede zwischen geänderten und gespeicherten Dateien: ``git diff`` 
## Kommunikation mit GITHUB