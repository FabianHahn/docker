#/bin/bash

pushd $(dirname $(readlink -f $0))

docker rm -f droppy
./docker-create.sh
docker network connect nginx droppy
docker start droppy $@

popd
