#!/bin/bash
docker create -p 80:80 --name nginx-https-bootstrap -v /root/volume/letsencrypt:/etc/letsencrypt nginx-https-bootstrap
