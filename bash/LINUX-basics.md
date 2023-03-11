# LINUX - Basisbefehle

## Filesystem - Basis
|command|Beschreibung|
|---|---|
|`du`|Speicherplatz von Files im Filesystem|
|`df`|Speicherplatz allgemein|
|`lsof`|List offener Files (ggf. noch/nicht mehr gemounted)|
|`fsck`|Filesystem Check - korrupte Files zeigen und reparieren|
|`badblocks`|Korrupte Blöcke ausserhalb des Filesystems finden/reparieren|
|`fdisk`|Disk Partitions erstellen/bearbeiten (ursprünglich nur für solche mit MBR)|
|`parted`|Disk Partitions erstellen/bearbeiten (für Disks mit GPT u.a.)|

Szenario: "A program needs 1.3G of space to install. Check that there is enough space (incl. total sum)"  
`df -h --total`

Szenario: "You are running out of space and need to delete some files. List all files and folders greater than 500M - by size."  
`du -ha --threshold=500M | sort -rn`

## Networking
|command|Beschreibung|
|---|---|
|`hostname`|Rechner im Netzwerk - Name anzeigen oder setzen |
|`ifconfig`|Interface-Konfiguration|
|`ifcfg`|einfaches Skript, um IP-Adresse zu konfigurieren|
|`arp`|Adress Resolution Protocol: Übersetzt IP-Adresse in MAC-Adresse|
|`route`|zeigt/manipuliert IP Routing Table|
|`ip`|Details zu Netzwerk-Objekten (IP-Adresse, Routen, ...)|
|`ss`|Socket Statistics: über welche IP-Adressen/Port - Kombinationen kommunizieren Programme |
|`nmcli`|Network Manager Command Line Interface|
|`hostnamectl`|Hostname (pretty, kernel, transient)|
|`host <url>`|IP-Adresse(n) des Hosts anzeigen|
|`nslookup`|IP-Adresse(n) der Internet URL anzeigen|
|`dig <name server URL>`|Für Recherchen auf Name Servern|
|`systemd-resolve <hostname>`|weitere Alternative zum Auflösen hostname zu IP inkl. genutzem Protokoll|
|`whois <hostname>`|Lookup nameserver gem. Top Level Domain (.de - DENIC, .com - ICANN, ...)|
|`ping <hostname/IP>`|Verbindung zu einer Adresse prüfen|
|`tcpdump`|Als sudo: Netzwerk-Pakete mitprotokollieren (nicht nur TCP, auch UDP und ICMP|
|`netstat`|Netzwerk-Statistik; im Default zeigt es offene Sockets|
|`traceroute`|Verfolgt den Netzwerktraffic über Hops zum Ziel|
|`mtr <hostname> -r -c 5`|Kombi aus `traceroute` und `ping`, dauert lange, bis es Output gibt|

## Datentransfer von Rechner zu Rechner
|command|Beschreibung|
|---|---|
|`ssh-keygen`|Public-Private Key Paar erzeugen `ssh-keygen -f <Filename> -C <Kommentar am Ende von *.pub>`|
|`ssh-copy-id`|Public key auf Zielmaschine kopieren ` ssh-copy-id -i <key file>.pub <user>@<host`|
|`ssh`|ssh Verbindung aufbauen `ssh <user>@<host`|
|`curl`|Daten von Servern holen (`curl <URL> --output <file name>`) oder schicken - wie hier an das http-Feld profile `curl -F profile=@portrait.jpg https://example.com/upload.cgi`|
|`wget`|non-interactive File-Download - z.B. als output.txt mit Progress-Bar in MB Schritten `wget -O output.txt <URL> --progress=dot:mega`|
|`rsync`|Files über das Netzwerk anhand Zeitstempeln und Größen synchronisieren|
|`netcat` oder `nc`|File-Transfer im Intranet; File senden `nc 127.0.0.1 8080 < file.txt`, File empfangen `nc -l 8080 > file.txt`|
|`scp`|SecureCopy per ssh, hier von lokal versenden: `scp <payload> <user>@<host>:<destination path>`|

## Firewall und co
Status Firewall anschauen: `sudo firewall-cmd --state`
`sudo systemctl stop firewalld` 
`sudo systemctl start firewalld`
Alle ACLs sehen: `sudo firewall-cmd --list-all`
Alle Zonen sehen: `sudo firewall-cmd --list-all-zones`

`iptables` Paket Filter: `sudo iptables -L -n`

