FROM phusion/baseimage:0.9.19

CMD ["/sbin/my_init"]

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
		ca-certificates \
		nginx \
		php-fpm

RUN rm /etc/nginx/conf.d/default.conf
RUN mkdir -p /etc/nginx/available.d
COPY nginx-roundcube.conf /etc/nginx/available.d/
RUN ln -s /etc/nginx/available.d/nginx-roundcube.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/htdocs
COPY index.php /var/www/htdocs/index.php

COPY php.ini /etc/php/7.0/fpm/php.ini
COPY php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
RUN rm /etc/php/7.0/fpm/pool.d/www.conf
COPY php-fpm-pool.conf /etc/php/7.0/fpm/pool.d/php-fpm-pool.conf

RUN mkdir /etc/service/php-fpm
ADD php-fpm.sh /etc/service/php-fpm/run

RUN mkdir /etc/service/nginx
ADD nginx.sh /etc/service/nginx/run

EXPOSE 80

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
