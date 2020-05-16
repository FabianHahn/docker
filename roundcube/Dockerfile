FROM phusion/baseimage:0.11

CMD ["/sbin/my_init"]

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/ubuntu/ bionic nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
		ca-certificates \
		net-tools \
		iputils-ping \
		wget \
		nginx \
		sqlite3 \
		php-fpm \
		php-pspell \
		php-curl \
		php-pear \
		php-sqlite3 \
		php-mbstring

RUN mkdir -p /usr/local/share/ca-certificates
COPY ca.crt /usr/local/share/ca-certificates/smf68.crt
RUN update-ca-certificates

RUN rm /etc/nginx/conf.d/default.conf
RUN mkdir -p /etc/nginx/available.d
COPY nginx-roundcube.conf /etc/nginx/available.d/
RUN ln -s /etc/nginx/available.d/nginx-roundcube.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/htdocs
RUN wget -O /tmp/roundcube.tar.gz https://github.com/roundcube/roundcubemail/releases/download/1.2.4/roundcubemail-1.2.4-complete.tar.gz \
	&& tar xfz /tmp/roundcube.tar.gz -C /var/www/htdocs --strip-components=1 \
	&& chown -R www-data:www-data /var/www/htdocs
COPY config.inc.php /var/www/htdocs/config/config.inc.php
RUN mkdir -p /var/db/roundcube \
	&& chown -R www-data:www-data /var/db/roundcube \
	&& chmod 777 /var/db/roundcube
VOLUME /var/db
RUN mkdir -p /etc/roundcube
VOLUME /etc/roundcube

COPY php.ini /etc/php/7.2/fpm/php.ini
COPY php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
RUN rm /etc/php/7.2/fpm/pool.d/www.conf
COPY php-fpm-pool.conf /etc/php/7.2/fpm/pool.d/php-fpm-pool.conf

RUN mkdir /etc/service/php-fpm
ADD php-fpm.sh /etc/service/php-fpm/run

RUN mkdir /etc/service/nginx
ADD nginx.sh /etc/service/nginx/run

EXPOSE 80

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
