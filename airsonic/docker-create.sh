#!/bin/bash
docker create \
	--name airsonic \
	--hostname music.hahn.graphics \
	-v /root/volume/airsonic/data:/home/airsonic/data \
	-v /root/volume/airsonic/music:/home/airsonic/music \
	-v /root/volume/airsonic/playlists:/home/airsonic/playlists \
	-v /root/volume/airsonic/podcasts:/home/airsonic/podcasts \
	--env AIRSONIC_DIR=/home/airsonic \
	--env CONTEXT_PATH=/airsonic \
	--env JAVA_OPTS="-Xmx512m -Dserver.use-forward-headers=true" \
	airsonic/airsonic:10.6.2-RELEASE

