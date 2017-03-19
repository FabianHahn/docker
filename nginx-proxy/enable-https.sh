#!/bin/bash
ln -s /etc/nginx/available.d/nginx-proxy-https.conf /etc/nginx/conf.d/
ln -s /letsencrypt-renew.sh /etc/cron.daily/
service nginx reload
