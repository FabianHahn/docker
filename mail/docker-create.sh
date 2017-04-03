#!/bin/bash
docker create \
	-p 25:25 \
	-p 587:587 \
	-p 993:993 \
	--name mail \
	--hostname mail.hahn.graphics \
	-v /root/volume/letsencrypt:/etc/letsencrypt \
	-v /root/volume/maildata:/var/mail \
	-v /root/volume/mailstate:/var/mail-state \
	-v /root/volume/mailconfig:/tmp/docker-mailserver \
	--env ENABLE_SPAMASSASSIN=1 \
	--env ENABLE_CLAMAV=1 \
	--env ENABLE_FAIL2BAN=1 \
	--env ENABLE_POSTGREY=1 \
	--env SSL_TYPE=letsencrypt \
	--env ONE_DIR=1 \
	--cap-add NET_ADMIN \
	tvial/docker-mailserver:2.2
