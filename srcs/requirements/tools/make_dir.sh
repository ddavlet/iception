#!/bin/sh

# Creating directories
if [ ! -d "/Users/HP/data" ]; then
	mkdir /Users/HP/data
fi
if [ ! -d "/Users/HP/data/mariadb" ]; then
	mkdir /Users/HP/data/mariadb
fi
if [ ! -d "/Users/HP/data/wordpress" ]; then
	mkdir /Users/HP/data/wordpress
fi
if [ ! -d "/Users/HP/data/backup" ]; then
	mkdir /Users/HP/data/backup
fi
