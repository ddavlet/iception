all: up

up:
	mkdir -p /Users/${USER}/data/wordpress
	mkdir -p /Users/${USER}/data/mariadb
	chmod -R 777 /Users/${USER}/data/
	docker compose -f srcs/docker-compose.yml up --build
down:
	docker compose -f srcs/docker-compose.yml down
clean: down
	# docker system prune -af
	# docker volume prune -af
	# docker volume rm wp-volume
	# docker volume rm db-volume
	# rm -rf /Users/${USER}/data

fclean: down clean
	docker volume prune -af
	rm -rf /Users/${USER}/data

re: fclean up
