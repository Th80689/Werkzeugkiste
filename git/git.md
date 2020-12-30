# GIT - Versionsverwaltung

## Lokales GIT
### GIT konfigurieren
|Aktion|Code|
|------------|---------------------|
|Nutzer-Name abfragen|``git config --global user.name``|
|Nutzer-Name eingeben|``git config --global user.name <Vorname Nachname>``|
|Nutzer-Email| ``git config --global user.email <x@y.com>``|
|Alle Repo-Eigenschaften|``git config -l``|

### Ein Verzeichnis unter Versionskontrolle nehmen: 
1) in das Ziel-Verzeichnis wechseln ``cd <Zielverzeichnis>``  
2) Repository initialisieren (= Verzeichnis .git anlegen) ``git init``
3) Alles (Verzeichnisse und Dateien), was im Ziel-Verzeichnis ist, unter Versionskontrolle (staging area / index) nehmen: ``git add .``
5) Änderungen aus Index zurückziehen ``git restore --staged <file>...``
4) Index in das Repository überführen: ``git commit``
4a) Schritte 3 und 4 können mit ``git commit -a`` abgekürzt werden 

### Erforschen und suchen
Genereller Status im working directory und in stage; ``git status``  
Änderungen, die noch nicht in der Staging-Area sind: ``git diff``   
Änderungen, die gestaged, aber noch nicht im Repository sind: ``git diff   --cached``  
Im Repo suchen ``git grep "<-Such-Ausdruck>" [Version]``  
Grafisch Änderungen seit Zeitpunkt suchen``gitk --since="1 day ago"``

### Projekthistorie
Liste aller Commits ``git log``  
Liste aller Commits inkl. Details und DIFFs ``git log -p``  
Überblick über Commits ``git log --stat --summary``  
Grafische Übersicht der Commits``gitk``

### Administration
Neuen Branch initialisieren ``git branch <branch-name>``  
Branch abfragen (* markiert den "aktuellen") ``git branch``  
Branch wechseln ``git switch <Zielbranch>``  
Branches verschmelzen (im main) ``git merge <branch to merge>``  
Branch löschen (mit Prüfung) ``git branch -d <Zielbranch>``  
Branch löschen (OHNE Prüfung) ``git branch -D <Zielbranch>``  
Commits zusammenfassen ``git rebase --interactive``

### Repo-übergreifende Aktionen
Aktuelles Remote Repo abfragen ``git remote``  
Aktuelles "origin" Repo abfragen ``git config --get remote.origin.url``  
Remote-Repo definieren ``git remote add <Kurzname Repo> <Quelle>``  
Repository clonen ``git clone <Quelle> <Zielverzeichnis>``  
Änderungen ziehen UND mergen (aus Verzeichnis Ziel-Repository) ``git pull <Quelle> <Zielbranch>``  
Vorschau auf Änderungen ``git fetch <Pfad Quell-Repository> <branch>`` + ``git log -p HEAD..FETCH_HEAD`` (nur Änderungen im "anderen" Repo)  
Grafische Sicht (nur Änderungen im "anderen" Repo)``gitk HEAD..FETCH_HEAD``  
Grafische Sicht (ALLE Änderungen in BEIDEN Repos)``gitk HEAD...FETCH_HEAD``  

## Kommunikation mit GITHUB

