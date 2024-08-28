all: up

up:
	bash ./srcs/requirements/tools/make_dir.sh
	docker compose -f srcs/docker-compose.yml up --build
down:
	docker compose -f srcs/docker-compose.yml down
clean_dockers: down
	docker system prune -af --volumes

clean_volumes:
	docker volume ls -qf dangling=true | xargs -r docker volume rm
	rm -rf /Users/HP/data

fclean: down clean_dockers clean_volumes

re: fclean up
