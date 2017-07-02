#!/bin/bash
letsencrypt renew \
	--text --non-interactive --agree-tos \
	--email fabian@hahn.graphics \
	2>&1 >>/var/log/letsencrypt-renew.log
service nginx reload
