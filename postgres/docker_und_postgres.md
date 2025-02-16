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