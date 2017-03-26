#/bin/bash

docker rm -f nginx-https-bootstrap
docker build -t nginx-https-bootstrap .
./docker-create.sh
docker start nginx-https-bootstrap
sleep 10
docker exec nginx-https-bootstrap /letsencrypt-init.sh
docker rm -f nginx-https-bootstrap

