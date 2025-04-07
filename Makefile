# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chon <chon@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/12 09:26:51 by chon              #+#    #+#              #
#    Updated: 2025/03/27 19:34:44 by chon             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

name = inception
docker_compose = docker-compose -f srcs/docker-compose.yml --env-file srcs/.env

all:
	@printf "Launch configuration ${name}...\n"
	@bash srcs/requirements/tools/make_dir.sh
	@${docker_compose} up -d nginx wordpress mariadb

bonus:
	@printf "Launch bonus configuration ${name}...\n"
	@bash srcs/requirements/tools/make_dir.sh
	@${docker_compose} up -d

build:
	@printf "Build configuration ${name}...\n"
	@bash srcs/requirements/tools/make_dir.sh
	@${docker_compose} up -d --build nginx wordpress mariadb

bbuild:
	@printf "Build bonus configuration ${name}...\n"
	@bash srcs/requirements/tools/make_dir.sh
	@${docker_compose} up -d --build

down:
	@printf "Stop configuration ${name}...\n"
	@${docker_compose} down

clean: down
	@printf "Cleaning configuration...\n"
	@docker system prune -a

fclean: clean
	@printf "Full clean\n"
	@docker volume ls -q | xargs -r docker volume rm
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data/portainer/*

re:	fclean all
	@printf "Rebuild configuration ${name} completed\n"

.PHONY: all bonus build bbonus down clean fclean re