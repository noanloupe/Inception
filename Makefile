all: build

build:
	sudo sed -i 's/ noloupe.42.fr//' /etc/hosts
	mkdir -p /home/noloupe/data/mariadb
	mkdir -p /home/noloupe/data/wordpress
	sudo sed -i 's/^127.0.0.1.*localhost/& noloupe.42.fr/' /etc/hosts
	sudo docker-compose -f srcs/docker-compose.yml up --build

up: down
	mkdir -p /home/noloupe/data/mariadb
	mkdir -p /home/noloupe/data/wordpress
	sudo sed -i 's/^127.0.0.1.*localhost/& noloupe.42.fr/' /etc/hosts
	sudo docker-compose -f srcs/docker-compose.yml up -d

down:
	sudo docker-compose -f srcs/docker-compose.yml down

clean:
	sudo docker-compose -f srcs/docker-compose.yml down --rmi all --volumes
	sudo rm -rf /home/noloupe/data
	sudo sed -i 's/ noloupe.42.fr//' /etc/hosts

.PHONY: all build up down clean
