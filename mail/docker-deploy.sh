#/bin/bash

docker rm -f mail 
./docker-create.sh
docker network connect mail mail
docker start mail
