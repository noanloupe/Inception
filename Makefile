all: build

build: clean
	mkdir -p /home/noloupe/Inception/volumes/mariadb
	mkdir -p /home/noloupe/Inception/volumes/wordpress
	sudo sed -i 's/127.0.0.1  localhost/127.0.0.1  noloupe.42.fr/' /etc/hosts
	sudo docker compose -f srcs/docker-compose.yml up --build

up: down
	mkdir -p /home/noloupe/Inception/volumes/mariadb
	mkdir -p /home/noloupe/Inception/volumes/wordpress
	sudo sed -i 's/127.0.0.1  localhost/127.0.0.1  noloupe.42.fr/' /etc/hosts
	sudo docker compose -f srcs/docker-compose.yml up -d

down:
	sudo docker compose -f srcs/docker-compose.yml down

clean:
	sudo docker compose -f srcs/docker-compose.yml down --rmi all --volumes
	sudo rm -rf /home/noloupe/Inception/volumes
	sudo sed -i 's/127.0.0.1  noloupe.42.fr/127.0.0.1  localhost/' /etc/hosts

.PHONY: all build up down clean
