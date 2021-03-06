#!/bin/bash
echo "Creating certificate..."
letsencrypt certonly \
	--webroot -w /var/www/ \
	-d poliwhirl.hahn.graphics \
	-d mail.hahn.graphics \
	-d music.hahn.graphics \
	--text --expand --non-interactive --agree-tos \
	--email fabian@hahn.graphics

if [ ! -f /etc/letsencrypt/dhparam.pem ]; then
	openssl dhparam -dsaparam -out /etc/letsencrypt/dhparam.pem 2048
fi

