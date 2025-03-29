#!/bin/bash
if [ ! -d "/~/chon/data" ]; then
        mkdir -p ~/data
        mkdir -p ~/data/mariadb
        mkdir -p ~/data/wordpress
        mkdir -p ~/data/portainer
fi

sudo chown -R $USER:$USER ~/data
sudo chmod -R 777 ~/data