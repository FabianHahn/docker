#/bin/bash

pushd $(dirname $(readlink -f $0))

docker rm -f roundcube
docker build -t roundcube .
./docker-create.sh
docker network connect nginx roundcube
docker network connect mail roundcube
docker start roundcube $@

popd
