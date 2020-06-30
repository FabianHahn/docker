#!/bin/bash
docker create \
	--name upload \
	-v /root/volume/airsonic/music:/files \
	-v /root/volume/droppy:/config \
	silverwind/droppy:11.1.0	
