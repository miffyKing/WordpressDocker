
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all: up

up:
	@bash srcs/requirements/tools/volume.sh
	@bash srcs/requirements/tools/hosts.sh
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d --build

down:
	docker compose -f $(DOCKER_COMPOSE_FILE) down --volumes

clean:
	sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	docker compose -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes

fclean: clean
	sudo rm -rf ${HOME}/data
	sudo docker system prune --volumes --all --force
	sudo docker network prune --force
	sudo docker volume prune --force
	@bash srcs/requirements/tools/fclean.sh

re:
	@make fclean
	@make all

.PHONY: all build down clean fclean re
