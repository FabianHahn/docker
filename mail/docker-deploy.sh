#/bin/bash

pushd $(dirname $(readlink -f $0))

docker rm -f mail 
./docker-create.sh
docker network connect mail mail
docker start mail $@

popd
