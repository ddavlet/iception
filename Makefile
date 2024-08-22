all: up

up:
	docker compose -f srcs/docker-compose.yml up --build
down:
	docker compose -f srcs/docker-compose.yml down
clean: down
	docker system prune -af

re: clean up
