FROM php:5.6-fpm

RUN apt-get update && apt-get install -y locales php5-gd php5-mysql php5-redis libpng12-dev libjpeg-dev libxml2-dev mailutils \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql zip exif soap \
	&& rm -rvf /usr/local/etc/php/conf.d/docker-php-ext-pdo.ini; \
	rm -rvf /usr/local/etc/php/conf.d/docker-php-ext-curl.ini; \
	rm -rf /tmp/*
RUN pecl install redis
COPY redis.ini /usr/local/etc/php/conf.d/
