#!/bin/sh

# Creating directories
if [ ! -d "/home/root/data" ]; then
	mkdir /home/root/data
fi
if [ ! -d "/home/root/data/mariadb" ]; then
	mkdir /home/root/data/mariadb
fi
if [ ! -d "/home/root/data/wordpress" ]; then
	mkdir /home/root/data/wordpress
fi
if [ ! -d "/home/root/data/backup" ]; then
	mkdir /home/root/data/backup
fi
