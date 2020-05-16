#!/bin/bash
exec php-fpm7.2 \
	--prefix / \
	--php-ini /etc/php/7.2/fpm/php.ini \
	--fpm-config /etc/php/7.2/fpm/php-fpm.conf \
	--nodaemonize
