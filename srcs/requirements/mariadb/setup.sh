#!/bin/bash

service mysql start

# Define SQL commands for initialization
cat<<EOF > /tmp/db.sql
CREATE DATABASE IF NOT EXISTS ${DB_NAME} ;
CREATE USER IF NOT EXISTS '${DB_ADMN}'@'%' IDENTIFIED BY '${DB_ADMNPWD}' ;
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_ADMN}'@'%' ;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USRPWD}' ;
GRANT SELECT, INSERT, UPDATE, DELETE ON ${DB_NAME}.* TO '${DB_USER}'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_RTPWD}' ;
FLUSH PRIVILEGES;
EOF
# Execute SQL commands
mysql < /tmp/db.sql
# Stop MySQL service
# service mysql stop
# Restart MySQL service
# service mysql start
service mariadb restart
