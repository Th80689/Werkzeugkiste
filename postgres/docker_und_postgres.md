# PG-Playground mit Docker

Quelle: https://www.docker.com/blog/how-to-use-the-postgres-docker-official-image/

Image holen: ```docker pull postgres:latest```  
Container im Hintergrund starten:   
```docker run --name pg_playground -p 5432:5432 -e POSTGRES_PASSWORD=pg_admin -d postgres```  

Container mit interaktivem Terminal und psql starten: 
```docker run --name psql_playground -it postgres psql -U postgres```

Auf dem Rechner: unter \users\DockerTests

# für Postgres
mkdir pg
docker pull postgres:latest

docker run --name pg-metabase -e POSTGRES_PASSWORD=pg_admin -d metabase

# Postgres-Vorbereitung für Metabase

```CREATE USER metabase WITH LOGIN PASSWORD 'mb_home';```   
```CREATE DATABASE metabase_home;```   
```GRANT ALL PRIVILEGES ON DATABASE metabase_home TO metabase;```   
```CREATE SCHEMA metabase;```  
```GRANT USAGE ON SCHEMA metabase TO metabase;```

### Schemas 
Default-Schema ist immer ```public```.
Syntax ist ```CREATE SCHEMA <schema_name>```. Namensregeln sind a) max. 31 Zeichen b) Startet mit Buchstabe oder "_", c) darf nicht mit 'pq_' beginnen. Der Zugriff auf das Schema kann mit ```GRANT USAGE ON SCHEMA <schema_name> TO <user_name>``` gegeben werden.
