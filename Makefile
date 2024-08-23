all: up

up:
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/mariadb
	chmod -R 777 /home/${USER}/data/
	docker compose -f srcs/docker-compose.yml up --build
	docker volume create wp-data
down:
	docker compose -f srcs/docker-compose.yml down
clean: down
	# docker system prune -af
	# docker volume prune -af
	rm -rf /home/ddavlet/data

re: clean up
