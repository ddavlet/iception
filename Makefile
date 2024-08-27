all: up

up:
	bash ./srcs/requirements/tools/make_dir.sh
	docker compose -f srcs/docker-compose.yml up --build
down:
	docker compose -f srcs/docker-compose.yml down
clean_dockers: down
	docker system prune -af

clean_volumes:
	docker volume ls -qf dangling=true | xargs -r docker volume rm

fclean: down clean_dockers clean_volumes
	rm -rf /home/root/data

re: fclean up
