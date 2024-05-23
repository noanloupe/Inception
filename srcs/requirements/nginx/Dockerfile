FROM	debian:buster

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt install nginx -y
RUN	apt install vim -y
RUN	apt install curl -y
RUN	apt install openssl -y
RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Bruxelles/O=19/OU=19/CN=noloupe.42.fr/UID=noloupe"
RUN	mkdir -p /var/run/nginx
COPY	conf/nginx.conf /etc/nginx/nginx.conf
RUN	chmod 755 /var/www/html
RUN	chown -R www-data:www-data /var/www/html

EXPOSE	80

CMD	["nginx", "-g", "daemon off;"]
