FROM	debian:buster

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt-get install -y\
		wget\
		php7.3\
		php-fpm\
		php-mysql\
		mariadb-client
RUN	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
RUN	mkdir -p /run/php
COPY	conf/php-fpm.conf /etc/php/7.3/fpm/
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/log/php7.3-fpm && \
    chmod 755 /var/log/php7.3-fpm && \
    chown -R www-data:www-data /var/log/php7.3-fpm

COPY	script.sh /
RUN	chmod +x /script.sh

ENTRYPOINT	["sh", "/script.sh"]
