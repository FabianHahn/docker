#!/bin/bash
exec php-fpm7.0 \
	--prefix / \
	--php-ini /etc/php/7.0/fpm/php.ini \
	--fpm-config /etc/php/7.0/fpm/php-fpm.conf \
	--nodaemonize
