FROM	debian:buster

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt-get install mariadb-server -y
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	script.sh /bin/
run	chmod +x /bin/script.sh

CMD ["script.sh", "mysqld_safe"];
