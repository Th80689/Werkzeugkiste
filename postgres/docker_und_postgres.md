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

docker run --name pg-playground -e POSTGRES_PASSWORD=mypppw -d postgres

# Postgres + Docker Tutorial
https://www.datacamp.com/tutorial/postgresql-docker

## Running PostgreSQL in a Docker container

Einfach:
```docker run --name postgres-db -e POSTGRES_PASSWORD=mypassword postgres````

## Bessere Konfiguration
### Docker Volume anlegen (persistente Speicherung)
```docker volume create postgres-data```

Spezifikationen für das Volume postgres-data anschauen: ```docker volume inspect postgres-data```


### Neuen Container postgres-db starten
docker run --name postgres-db \
  -e POSTGRES_PASSWORD=pgAdmin_M1 \
  -e POSTGRES_USER=pgadmin \
  -e POSTGRES_DB=finanzen \
  -p 127.0.0.1:5432:5432 \
  -v postgres-data:/var/lib/postgresql/data \
  -d postgres

### psql über Terminal aufrufen + Funktionstests
```docker exec -it postgres-db psql -U pgadmin -d finanzen````

```SELECT current_database(), current_user;```

### svg to pdf conversion
sips -s format pdf -o output2.pdf output2.svg