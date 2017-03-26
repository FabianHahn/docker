#!/bin/bash
docker network rm nginx
docker network create nginx \
	--internal \
	--subnet=192.168.100.0/24

