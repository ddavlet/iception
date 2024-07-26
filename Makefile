all: up

up:
	docker-compose -f compose.yaml up
down:
	docker-compose -f compose.yaml down
clean: down
	docker system prune -af
