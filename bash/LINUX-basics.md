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
|``||