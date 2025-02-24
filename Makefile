# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chon <chon@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/12 09:26:51 by chon              #+#    #+#              #
#    Updated: 2025/02/21 10:34:12 by chon             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml
SERVICE = inception  

# Build Docker images
build:
	$(DOCKER_COMPOSE) build

# Start containers in detached mode
up:
	$(DOCKER_COMPOSE) up -d

# Stop containers
down:
	$(DOCKER_COMPOSE) down

# Rebuild and restart
rebuild: down build up

# View logs
logs:
	$(DOCKER_COMPOSE) logs -f $(SERVICE)

# Remove all Docker resources
clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes --remove-orphans

.PHONY: build up down rebuild logs clean
