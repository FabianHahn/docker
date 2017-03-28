#!/bin/bash
docker create \
	--name roundcube \
	-v /root/volume/roundcubedb:/var/db \
	roundcube
