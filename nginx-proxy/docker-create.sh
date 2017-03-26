#!/bin/bash
docker create \
	-p 80:80 \
	-p 443:443 \
	--name nginx-proxy \
	-v /root/volume/letsencrypt:/etc/letsencrypt \
	nginx-proxy
