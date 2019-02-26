#Setup PostgreSQL DB on Docker container (persistent data)
mkdir -p $HOME/docker/volumes/postgres

docker run --rm --name pg-docker \
           -e POSTGRES_PASSWORD=password \
           -d -p 127.0.0.1:5432:5432 \
           -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data postgres

#install phppg_admin
docker -exec -ti postgres /bin/bash
createuser testuser -P --createdb -h postgres1 -U postgres
##->add password creation


docker run --name phppgadmin-docker -ti -d \
           -p 8080:80 \
           -e DB_HOST=postgres1 phppgadmin

#To connect to PG without installing it on the current instance, run:
#docker exec --tty --interactive pg-docker psql -h localhost -U postgres -d postgres