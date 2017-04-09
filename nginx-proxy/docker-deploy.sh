#/bin/bash

pushd $(dirname $(readlink -f $0))

docker rm -f nginx-proxy
docker build -t nginx-proxy .
./docker-create.sh
docker network connect nginx nginx-proxy
docker start nginx-proxy $@

popd
