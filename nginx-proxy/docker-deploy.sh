#/bin/bash

docker rm -f nginx-proxy
docker build -t nginx-proxy .
./docker-create.sh
docker start nginx-proxy
