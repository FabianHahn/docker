#/bin/bash

docker rm -f mail 
./docker-create.sh
docker start mail
