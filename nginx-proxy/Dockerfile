FROM phusion/baseimage:0.9.22

CMD ["/sbin/my_init"]

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
		ca-certificates \
		net-tools \
		iputils-ping \
		nginx \
		letsencrypt

RUN rm /etc/nginx/conf.d/default.conf
RUN mkdir -p /etc/nginx/available.d
COPY nginx-proxy-https.conf /etc/nginx/available.d/
RUN ln -s /etc/nginx/available.d/nginx-proxy-https.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/htdocs
COPY index.html /var/www/htdocs/index.html

RUN mkdir -p /var/www/.well-known
COPY letsencrypt-renew.sh /
RUN ln -s /letsencrypt-renew.sh /etc/cron.daily/letsencrypt-renew
VOLUME /etc/letsencrypt

RUN mkdir /etc/service/nginx
ADD nginx.sh /etc/service/nginx/run

EXPOSE 80 443

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
