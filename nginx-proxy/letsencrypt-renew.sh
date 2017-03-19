#!/bin/bash
letsencrypt renew \
	--text --non-interactive --agree-tos \
	--email fabian@hahn.graphics
service nginx reload
