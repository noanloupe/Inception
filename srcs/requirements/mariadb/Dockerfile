FROM	debian:buster

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt-get install mariadb-server -y
RUN	apt install vim -y
RUN	apt install curl -y
COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	script.sh /
run	chmod +x /script.sh

ENTRYPOINT ["bash", "script.sh"]
