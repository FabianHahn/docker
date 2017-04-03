#!/bin/bash
docker create \
	--name roundcube \
	-v /root/volume/roundcubedb:/var/db \
	-v /root/volume/roundcubeconfig:/etc/roundcube \
	roundcube
