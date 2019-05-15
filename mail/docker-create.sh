#!/bin/bash
docker create \
	-p 25:25 \
	-p 143:143 \
	-p 587:587 \
	-p 993:993 \
	--name mail \
	--hostname mail.hahn.graphics \
	-v /root/volume/letsencrypt:/etc/letsencrypt \
	-v /root/volume/maildata:/var/mail \
	-v /root/volume/mailstate:/var/mail-state \
	-v /root/volume/mailconfig:/tmp/docker-mailserver \
	-v /root/volume/mailconfig/dovecot/10-mail.conf:/etc/dovecot/conf.d/10-mail.conf \
	-v /root/volume/mailconfig/dovecot/20-imap.conf:/etc/dovecot/conf.d/20-imap.conf \
	-v /root/volume/mailconfig/dovecot/90-quota.conf:/etc/dovecot/conf.d/90-quota.conf \
	-v /root/volume/mailconfig/dovecot/quota-warning.sh:/usr/local/bin/quota-warning.sh \
	--env ENABLE_SPAMASSASSIN=1 \
	--env ENABLE_CLAMAV=0 \
	--env ENABLE_FAIL2BAN=1 \
	--env ENABLE_POSTGREY=1 \
	--env SSL_TYPE=letsencrypt \
	--env ONE_DIR=1 \
	--cap-add NET_ADMIN \
	tvial/docker-mailserver:2.3
