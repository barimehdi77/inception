# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mbari <mbari@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/20 16:42:57 by mbari             #+#    #+#              #
#    Updated: 2021/12/20 18:19:35 by mbari            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME=/home/mbari

# Colors variables
RED = \033[1;31m
GREEN = \033[1;32m
YELLOW = \033[1;33m
BLUE = \033[1;34m
RESET = \033[0m

all: credit hosts rvolumes volumes build up

hosts:
	@sudo sed -i "s/127.0.0.1/127.0.0.1		mbari.42.fr/g" /etc/hosts

ls:
	@echo "$(GREEN)██████████████████████████ IMAGES ███████████████████████████$(RESET)"
	@docker images
	@echo "$(YELLOW)██████████████████████ ALL CONTAINERS ███████████████████████$(RESET)"
	@docker ps -a
	
build:
	@echo "$(BLUE)██████████████████████ Building Images ███████████████████████$(RESET)"
	docker-compose -f ./srcs/docker-compose.yml build

up:
	@echo "$(GREEN)██████████████████████ Running Containers ██████████████████████$(RESET)"
	@docker-compose -f ./srcs/docker-compose.yml up -d
	@echo "$(RED)╔════════════════════════════║NOTE:║════════════════════════╗$(RESET)"
	@echo "$(RED)║   $(BLUE) You can see The Containers logs using $(YELLOW)make logs        $(RED)║$(RESET)"
	@echo "$(RED)╚═══════════════════════════════════════════════════════════╝$(RESET)"


logs:
	@echo "$(GREEN)██████████████████████ Running Containers ██████████████████████$(RESET)"
	docker-compose -f ./srcs/docker-compose.yml logs
	

status:
	@echo "$(GREEN)██████████████████████ The Running Containers ██████████████████████$(RESET)"
	docker ps


stop:
	@echo "$(RED)████████████████████ Stoping Containers █████████████████████$(RESET)"
	docker-compose -f ./srcs/docker-compose.yml stop

down:
	@echo "$(RED)██████████████████ Removing All Containers ██████████████████$(RESET)"
	docker-compose -f ./srcs/docker-compose.yml down

reload: down rvolumes build up

rm:
	@echo "$(RED)██████████████████ Removing All Containers ██████████████████$(RESET)"
	docker-compose -f ./srcs/docker-compose.yml down
	@echo "$(RED)█████████████████████ Deleting volumes ██████████████████████$(RESET)"
	sudo rm -rf $(HOME)/data/
	@echo "$(RED)█████████████████████ Remove Everything ██████████████████████$(RESET)"
	docker system prune -a
	
rvolumes:
	@echo "$(RED)█████████████████████ Deleting volumes ██████████████████████$(RESET)"
	sudo rm -rf $(HOME)/data

volumes:
	@echo "$(GREEN)█████████████████████ Creating volumes ██████████████████████$(RESET)"
	mkdir -p $(HOME)/data/db-data
	mkdir -p $(HOME)/data/www-data
	mkdir -p $(HOME)/data/backup-data


# Print Credit
credit:
	@echo "██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗██╗ ██████╗ ███╗   ██╗"
	@echo "██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║"
	@echo "██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║"
	@echo "██║██║╚██╗██║██║     ██╔══╝  ██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║"
	@echo "██║██║ ╚████║╚██████╗███████╗██║        ██║   ██║╚██████╔╝██║ ╚████║"
	@echo "╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "━━━━━━━━━━━━━━━━━━━━┃Made with love by : \033[1;91mmbari\033[m┃━━━━━━━━━━━━━━━━━━━━━"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
