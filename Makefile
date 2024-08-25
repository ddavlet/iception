all: up

up:
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/mariadb
	chmod -R 777 /home/${USER}/data/
	docker compose -f srcs/docker-compose.yml up --build
down:
	docker compose -f srcs/docker-compose.yml down
clean: down
	docker system prune -af

fclean: down clean
	rm -rf /home/${USER}/data

re: fclean up
