# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mriant <mriant@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/09 13:52:53 by mriant            #+#    #+#              #
#    Updated: 2023/08/09 15:35:52 by mriant           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE = srcs/docker-compose.yml

VOLUME_DB=/home/mriant/data/database
VOLUME_WEBSITE=/home/mriant/data/website

.PHONY: all
all: up

.PHONY: up
up: build
	docker compose -f ${DOCKER_COMPOSE} up

.PHONY: down
down:
	docker compose -f ${DOCKER_COMPOSE} down

.PHONY: build
build:
	sudo mkdir -p ${VOLUME_WEBSITE}
	sudo mkdir -p ${VOLUME_DB}
	docker compose -f ${DOCKER_COMPOSE} build

.PHONY: clean_images
clean_images: down
	docker system prune -af

.PHONY: clean_volumes
clean_volumes: down
	if [ $(shell docker volume ls -q | wc -l) != '0' ]; \
	then \
		docker volume rm -f $(shell docker volume ls -q); \
	fi
	sudo rm -rf ${VOLUME_DB} ${VOLUME_WEBSITE}

.PHONY: fclean
fclean: clean_images clean_volumes

.PHONY: re
re: fclean
	make all
