#/bin/bash

pushd $(dirname $(readlink -f $0))

docker rm -f upload
./docker-create.sh
docker network connect nginx upload
docker start upload $@

popd
