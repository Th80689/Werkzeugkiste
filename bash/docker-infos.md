# Docker - Infos
## Docker auf Ubunto installieren
### Repository vorbereiten
1. Verzeichnis für Keys vorbereiten: `sudo mkdir -p /etc/apt/keyrings`
2. Aktuelle Docker Keyrings holen: `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`
3. Repository initialisieren: `echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
### Docker installieren, updaten und in Docker Hub anmelden
1. Verzeichnis der aktuellen Ubuntu packages holen: `sudo apt-get update`
2. Notwendige Packages für Docker installieren: `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin`
3. Funktion von docker und docker compose prüfen `docker --version` und `docker compose version`
4. In Docker anmelden `sudo docker login` -- wenn es eine eigene längerfristige Maschine, sollte man das unverschlüsselte Passwort unter /root/.docker/config.json gem. https://docs.docker.com/engine/reference/commandline/login/#credentials-store ersetzen.
5. Funktion checken: `sudo docker run hello-world`
## Mit Images arbeiten
1. Auf der Maschine vorhanden Images anschauen: `sudo docker images`
2. Image holen:`docker pull [image name]:[tag name]` - hier CentOS latest: `sudo docker pull centos`
3. Images starten: `sudo docker run -d - t --name <namecontainer> <image>` (d: detached, t: starte Prozess, der den Container am Leben erhält)
4. Liste der Container anzeigen: `sudo docker container ls` (ohne Option: nur die laufenden, mit -a ALLE)
