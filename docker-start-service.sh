#!/bin/bash

pushd $(dirname $(readlink -f $0))

$1/docker-deploy.sh -a

popd
