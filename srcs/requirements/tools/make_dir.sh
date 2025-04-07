#!/bin/bash

if [ ! -d "/~/chon/data" ]; then
        mkdir -p ~/data
fi

if [ ! -d "/~/data/mariadb" ]; then
        mkdir -p ~/data/mariadb
fi

if [ ! -d "/~/data/wordpress" ]; then
        mkdir -p ~/data/wordpress
fi

if [ ! -d "/~/data/portainer" ]; then
        mkdir -p ~/data/portainer
fi

sudo chown -R $USER:$USER ~/data
sudo chmod -R 777 ~/data