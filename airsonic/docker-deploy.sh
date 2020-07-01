#/bin/bash

pushd $(dirname $(readlink -f $0))

docker rm -f airsonic
./docker-create.sh
docker network connect nginx airsonic 
docker start airsonic $@

popd
