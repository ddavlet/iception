#!/bin/sh

# Creating directories
if [ ! -d "$HOME/data" ]; then
        mkdir ~/data
        mkdir ~/data/mariadb
        mkdir ~/data/wordpress
        # mkdir ~/data/portainer
fi
