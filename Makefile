# COLOUR DEFINITION #

RED     := \033[0;31m
BLUE    := \033[0;34m
GREEN   := \033[1;32m
WHITE   := \033[0;37m
RESET   := \033[0m

COMPOSE_DIRECTORY=./srcs/docker-compose.yml

# COMPILER #

all: run

run: 
	@echo "$(GREEN)Making volume directories ... $(RESET)"
	@sudo mkdir -p /home/${USER}/data/wordpress
	@sudo mkdir -p /home/${USER}/data/mariadb
	@echo "$(GREEN)Launching docker compose ... $(RESET)"
	@docker compose -f $(COMPOSE_DIRECTORY) up --build

up:
	@echo "$(GREEN)Making volume directories ... $(RESET)"
	@sudo mkdir -p /home/${USER}/data/wordpress
	@sudo mkdir -p /home/${USER}/data/mariadb
	@echo "$(GREEN)Launching docker compose ... $(RESET)"
	@docker compose -f $(COMPOSE_DIRECTORY) up -d --build

debug:
	@echo "$(GREEN)Making volume directories ... $(RESET)"
	@sudo mkdir -p /home/${USER}/data/wordpress
	@sudo mkdir -p /home/${USER}/data/mariadb
	@echo "$(GREEN)Launching docker compose with logs... $(RESET)"
	@docker compose -f $(COMPOSE_DIRECTORY) --verbose up

containers:	
	@echo "$(BLUE)Listing all containers ... $(RESET)"
	 docker ps -a

images:	
	@echo "$(BLUE)Listing all images ... $(RESET)"
	 docker images

volumes:
	@echo "$(BLUE)Listing volumes ... $(RESET)"
	docker volume ls

clean: 	
	@echo "$(RED)Stopping containers ... $(RESET)"
	@docker compose -f $(COMPOSE_DIRECTORY) down
	@echo "$(RED)Deleting all images ... $(RESET)"
	@docker rmi -f `docker images -qa`
	@echo "$(RED)Deleting all volumes ... $(RESET)"
	@docker volume rm `docker volume ls -q`
	@echo "$(RED)Deleting all data ... $(RESET)"
	@sudo rm -rf /home/${USER}/data
	@echo "$(RED)All deleted.$(RESET)"

.PHONY: run up debug containers volumes clean