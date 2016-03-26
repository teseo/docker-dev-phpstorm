FROM php:5.6-fpm

RUN apt-get update && apt-get install -y locales php5-gd php5-mysql memcached php-gettext gettext libpng12-dev libjpeg-dev libpq-dev libxml2-dev mailutils \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql zip exif soap \
	&& rm -rvf /usr/local/etc/php/conf.d/docker-php-ext-pdo.ini; \
	rm -rvf /usr/local/etc/php/conf.d/docker-php-ext-curl.ini; \
	rm -rf /tmp/*