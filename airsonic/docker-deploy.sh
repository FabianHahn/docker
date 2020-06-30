#/bin/bash

pushd $(dirname $(readlink -f $0))

docker rm -f music
./docker-create.sh
docker network connect nginx music
docker start music $@

popd
