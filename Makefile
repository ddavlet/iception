all: up

up:
	bash ./srcs/requirements/tools/make_dir.sh
	docker compose -f srcs/docker-compose.yml up --build
down:
	docker compose -f srcs/docker-compose.yml down
clean: down
	# docker system prune -af

fclean: down clean
	# docker volume prune -af
	rm -rf ~/data

re: fclean up
