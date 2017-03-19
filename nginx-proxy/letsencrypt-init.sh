#!/bin/bash
letsencrypt certonly \
	--webroot -w /var/www/ \
	-d poliwhirl.hahn.graphics \
	--text --non-interactive --agree-tos \
	--email fabian@hahn.graphics

