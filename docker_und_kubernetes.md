# Database Track 
https://campus.datacamp.com/courses/containerization-and-virtualization-concepts/foundations-of-containerization-and-virtualization?ex=1

## Docker vs. Kubernetes

|Docker|Kubernetes|
|---|---|
|Optimiert für: Developer Experience + wenige Container|Optimiert viele Container + Performance|

## Docker
Dockerfile: Bauanleitung zur Erstellung eines Docker-Image 
Dockerimage: Blaupause für Erstellung eines Docker-Container
Dockercontainer: lauffähige Instanz eines Containers; lauffähige Applikation

### Dockerfile
Das "Dockerfile" kann folgende Elemente enthalten:
1. Kommentare: ```#```
2. Instruktionen aus
- Befehlen (UPPERCASE)
- Parametern (lowercase)

Dockerfile-Befehle:
|Befehl|Beschreibung|Beispiel|
|--|--|--|
|```FROM <name_of_image>```|Startpunkt - Basisimage Image|```FROM python:3.10```|
|```COPY <source> <destination>```|Dateien in Container kopieren|```COPY ...```|
||wird nur der Ordnerpfad OHNE Filenamen angegeben, wird der ganze Pfad kopiert||
|```RUN <valid shell command> <Option>```|führt Programm im Container aus|```RUN pip install -r requirements.txt```|
|```ENTRYPOINT["command", "argument"]```|Primäre Aufgabe Container|```ENTRYPOINT["python", "hello_world.py"]```|
|```WORKDIR <path>```|ändert das Ziel im Ziel-Filesystem|nach Änderung kann man alles statt mit <long_path>/<xxx> mit ./<xxx> aufrufen|
|USER <user_name>|ändert User (und damit Rechte) für alle nachfolgenden Kommandos||
|```history <image-name>```|Befehle anschauen, die beim Build verwendet wurden - zeigt auch Variablen wie Passworte im Klartext||

### Variablen
|Befehl|Erläuterungen|Beispiel|
|-|-|-|
|```ARG <name>=<value>```|Variable, die per $<var_name> NUR im Dockerfile verwendet werden kann|ARG app_path=/users/app/example|
||ARG im Build übersteuern|```docker build --build-arg <name>=<value> .```|
|```ENV <name>=<value>```|Variable, die per $<var_name> auch NACH dem Build verwendet werden kann|```ENV DB_USER=pipeline_user``` kann danach in einem Aufruf verwendet werden: ```CMD psql -U $DB_USER``` |
||ENV im run übersteuern|```docker run --env <name>=<value> <image-name>```|


```CMD <shell_command>```
- beeinflusst NICHT den Build (wird nicht vergrößert, verlängert Zeit zum Build nicht, bei mehreren: NUR DAS LETZTE wird ausgeführt)
- Wird beim Image-Start ausgeführt
- sinnvoll, wenn der Container Interaktion von Außen annehmen soll
Beispiel ```CMD postgres```
- das CMD Kommando kann im RUN per Parameter übersteuert werden ```docker RUN <image> <shell_command>``` oder etwas auch interaktiv starten ```docker RUN <image> -it <shell_command>```

**Best Practices**
Jeder RUN Befehl vergrößert das Image => für Download-File Download, unzip und COPY chainen. Beispiel:```RUN curl <file_download_url> -o <destination_directory>/<filename>.zip / 
&& unzip <destination_directory>/<filename>.zip -d <unzipped_directory>   /
&& rm <destination_directory>/<filename>.zip```



Sequenzielle Ausführung der Anweisungen 

### Docker Image erstellen
```docker build <context>``` Container erstellen; context: Quelle des Docker-Files UND Zielort für das Docker-Image. Aktuelles Verzeichnis: "."  

|Command|Option|Beschreibung|
|--|--|--|
|build|||
||-t <image-name><:version>|Image mit Namen (optional mit Version) erstellen|
|pull <image-name>||Image vom https://hub.docker.com holen (latest)|
|pull <image-name>:<image-version>|||
|image inspect <image id\|name>||Zeigt Inhalt und Layers|
|images||zeigt verfügbare Docker Images (alias für image ls|
|images rm <image-name>|||
|container prune||entfernt alle gestoppten Container|
|docker image prune|-a|löscht alle Images mit mindestens einem Container|

Images mit ```jq``` untersuchen:  
CommandLine-Tool zum Untersuchen von JSON-Inhalten. Beispiel 1: ```docker image inspect <id> | jq '.[0] | .RootFS'```. Das heißt: hol den ersten Block aus JSON - und such danach nach dem Text RootFS.  
Beispiel 2: Anzahl der Layers zählen: ```docker image inspect <id> | jq '.[0] | {LayerCount: .RootFS.Layers | length}'```  




### Docker (CLI) Befehle
Docker wird über CLI angesprochen. Jeder Befehl startet mit ```docker``` gefolgt von ```command``` und danach (ggf.) notwendigen ```<parameter>```.
Einen Container kann man mit ```exit``` verlassen.

```docker run <name_of_image>``` startet Container

|Command|Option|Beschreibung|
|-|-|-|
|run [options] <parameter>||startet Container|
||-it|Startet interaktive Shell|
||-d|Startet Container im Hintergrund|
||--name <container-name><container-image>|Docker Image mit Alias starten|
||--rm|Container starten und nach Befehlausführung wieder löschen|
|ps||Zeigt alle laufenden Container|
||-f "name=<container-name>"|Suchfilter|
||-a|mehr Details|
|logs <container-id>|||
||-f <container-id>/container_name>|Logs verfolgen|
|stop <container_id>||Stoppt laufenden Container|
|container rm <container_id>||Container aus Speicher löschen|
### Images verteilen und holen
Neben dem offiziellen Repository hub.docker.com kann man auch aus anderen Repositories Images holen: mit ```docker pull <URL>/<image-name>```.  
Images werden mit ```docker image push <image-name>``` hochgeladen. Wenn das Ziel ein eigenes Repository sein soll: 
a) Einen Tag anlegen: ```docker tag <image-name>:<version> <URL>/<image-name>:<version>```
b) Hochladen mit ```docker image push <URL>/<image-name>:<version>```

Während das offizielle Docker-Registry kein Login braucht, kann das bei privaten Registries notwendig sein. Dafür gibt es den Befehl ```docker login <URL>```, der dann nach User und PW verlangt. Alternativ kann man das Image auch als Datei verschicken: ```docker save -o image.tar <image-name>:<version-id>```. Die so erzeugte Datei kann dann mit ```docker load -i image.tar``` geladen werden.

### Sicherheit - Best Practices
- Beim Image auf "Trusted Source" achten - Docker sieht "Trusted Content" bei
  - Docker official Images
  - Verified Publisher
  - Sponsored OSS
- In jedem Image automatische Updates integrieren. In Ubuntu: ```apt-get update``` und ```apt-get upgrade```
- Images "minimalistisch" halten: nur das installieren, was wirklich gebraucht wird
- Applikationen NIE nie unter ```root``` laufen lassen; 
Beispiel Dockerfile: 
```
FROM ubuntu
# Install als root
CMD apt-get install python3
# Danach: User anlegen
RUN useradd -m repl
# auf User wechseln
USER repl
``` 
### Daten zwischen Container und Host austauschen
Mit einem definierten ```bind-mount``` kann ein Container auf Daten im File-System des Hosts lesend und/oder schreibend zugreifen => Daten können den Conatiner-Tod überleben. Der Host kann die Daten aber erst lesen, wenn der Container nicht mehr läuft.

Es kann mit ```run -v <source>:<destination>``` im Dockerfile definiert werden. Beispiel: ```docker run -v ~/html:/var/www/html \nginx <IMAGE_NAME>```.

### Docker Volumes
Docker-gemanageder Speicherplatz außerhalb von Containern, der Container selber überlebt. Sie werden mit ```docker volume create <volumename>``` erstellt. Vorhandene Volumes kann man mit ```docker volume ls``` anschauen - im Datei mit ```docker volume inspect```. Mit ```docker volume rm``` können Volumes gelöscht werden.  
Vorhandene Volumes können mit ```docker run -v <volumename>:<destination_path>:<options>``` verbunden werden. Beispiel: ```docker run -v sqldata:/data postgres```.  
Mögliche Volume Drivers:
- Local Filesystem (Default)
- NFS (Unix filesharing)
- SMB/CIFS (Windows Filesharing)

### Network in Docker
Innerhalb von Containern kann man mit mehreren Befehlen Infos zu Netzwerken bekommen, z.B. ```ifconfig <interface>``` oder ```ip addr show <inteface>```. Standard ist auch ```ping -c <x> <host>``` mit x als Anzahl Pings und Host als Zielort für die Frage.  
Gültige Ports im Rahmen der Netzwerke liegen zwischen 0 und 65535.

Portmapping ist mit dem Befehl ```docker run -p <host port>:<container port> <Image-Name>``` (Option (publish)) möglich. Damit können mehrere Container mit unterschiedlichen IP-Adressen mit einem "Empfangsport" verbunden werden. Das -p kann einen priviligierten festen Port definieren (< 1024), das -P akzeptiert einen "flüchtigen/zufälligen" Port jenseits dieser Grenze. In einem Dockerfile kann man dokumentieren, welchen Port der Container nutzt. Das geschieht mit dem Befehl ```EXPOSE <port>```. Dieser Eintrag ersetzt aber NICHT das Portmapping mit -p innerhalb des Containers!  
Mit ```docker ps -a``` kann das Port-Mapping überprüft werden.  

```docker network <command>```
|Command|Bedeutung|Beispiel|
|-|-|-|
|create <network name>|Erstellt im Containter ein Network|```docker network create mynetwork```|
|ls|zeigt internes Network|```docker network ls```|
|rm|löscht ein Network|```docker network rm```|
|inspect <network-name>|zeigt Details an|```docker network inspect mynetwork```|
|```--network <network-name>```|Container mit Network verbinden||
|```connect <networkname><container>```|nachträglich verbinden|```docker network connect test_network alpine-prime```|

### Docker Compose
Mit Docker Compose kann eine Multi-Container-Applikation definiert werden.
Im File docker.yaml können mehrere Container und ihre Verbindungen definiert werden. Es enthält die Abschnitte   
```
service:
  ... # Define containers
networks:
  ... # Define networking details
volumes:
  ... # Define storage requirements
configs:
  ... # Define special config details beyound containers
secrets:
  ... # Define passwords etc.
```
Abhängigkeiten (Installations-Reihenfolgen) werden mit ```- depends_on``` - nach dem jeweiligen Image - definiert.  
Bedingungen, wann eine Ressource bereit ist, können mit ```condition:``` definiert werden. Mögliche Optionen 
- service_started (normal gestartet - Default)
- service_completed_successfully (initiale Konfiguration fertig)
- service_healthy (Kriterien gem . Healthcheck erfüllt)

Docker Compose wird mit ```docker compose up``` gestartet. Mit der Option -d läuft es im Hintergrund. 
Optional ```docker compose -f <yml-File> up``` - dann muss aber jeder compose-Befehl die Referenz auf das abweichende File haben. 
Eine Liste aller compose-kontrollierten Container erhält man über ```docker compose ls```. Herunterfahren geht mit ```docker compose down```.

- Logs: ```docker compose logs```
- Status Resourcen: ```docker compose top```


## Kubernetes
Kubernetes wird auch als K8s abgekürzt.
Sorgt für 
- Scheduling und Networking (wo soll ein Container deployed und wie soll er in ein Netzwerk eingebunden werden; wann soll er in welcher Reihenfolge gestartet/gestoppt werden, ...)
- wie soll ein Container mit Storage verbunden werden  
Kubernetes arbeitet mit Container Engines - sehr häufig mit Docker. Dabei übernimmt Docker das Erstellen und den Update der Container-Images und das Starten der Images. Danach übernimmt K8s die Orchestrierung.

 
### Architektur Komponenten
|Begriff|Bedeutung|
|---|---|
|Manifest|YAML-File, das die zu orchestrierenden Objekte deklarativ beschreibt.|
|Pod|enthält 1 oder mehr Container, kleinste zu deployende Einheit; alle Einheiten in einem Pod gehören logisch zusammen und teilen sich Speicher und Network; sie sind "flüchtig" = sie haben eine kurze Lebenszeit sie können und werden immer wieder gestoppt und wieder neu aufgebaut und können jederzeit auf andere Nodes verschoben werden|
|Kubelet|sorgt dafür das Container in Pods laufen|
|Kubernetes Service|sorgen für die Netzwerk-Verbindung von Pods nach außen, bieten eine stabile Außenanbindung, auch wenn Pods wegfallen oder neu aufgebaut werden|
|Node (oder Worker machines)|Sammlung von Containern, kleinste Computing-Einheit; in jedem Node läuft ein Kubelet|
|Control Plane|"Gehirn": steuert Nodes und Pods, Deployment, ... |
|Cluster|Emsemble aller Pods, Nodes und der Control Plane|

### Stateful Applications
- Wird im Manifest nicht mit "Deployment", sondern als ```kind: StatefulSet``` definiert
- Brauchen PVs (Persistent Volumes), die zu Pods über PVCs (Persistent Volume Claims) gemapped werden. Das erlaubt die Trennung von "Compute" und "Storage" und ermöglicht, dass Pods einfach ausgetauscht werden können.
- PVs können manuell vom Kubernetes Admin angelegt werden - oder dynamisch von normalen Usern. Dynamische Anlage erfordert die Definition von Storage Classes (SC)  
```kubectl get pv```  
```kubectl get sc```  
```kubectl get pvc```  


### Kubernetes Commands
|Befehl|Beschreibung>
|-|-|
|```kubectl --help```|zeigt Befehle des Kubernetes Cluster Managers|
|```kubectl create -f <mainfest file>```|Objekte erstellen|
|```kubectl apply -f <mainfest file>```|Objekte erstellen und Status wechseln|
|```kubectl delete -f <mainfest file>```|Deployment löschen|
|```kubectl get <object>```|Überblick über deployete Objekte bekommen|
|```kubectl describe <object>```|Details zu einem Objekt anschauen|