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
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@${docker_compose} up -d

build:
	@printf "Build configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@${docker_compose} up -d --build

down:
	@printf "Stop configuration ${name}...\n"
	@${docker_compose} down

re:	fclean
	@printf "Rebuild configuration ${name}...\n"
	@${docker_compose} up -d --build

clean: down
	@printf "Cleaning configuration...\n"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean: clean
	@printf "Full clean\n"
	-docker volume ls -q | xargs -r docker volume rm

.PHONY  : all build down re clean fclean