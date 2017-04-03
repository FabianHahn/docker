#!/bin/bash
docker network rm nginx
docker network create nginx \
	--internal \
	--subnet=192.168.100.0/24
docker network rm mail
docker network create mail \
	--internal \
	--subnet=192.168.101.0/24

