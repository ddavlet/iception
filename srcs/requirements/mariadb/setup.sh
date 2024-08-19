#!/bin/sh

#if mysql (settings folder for mariadb) is not installed
if [ ! -d "/var/lib/mysql/ibdata1" ]; then
    #set owenership of the folder
    chown -R mysql:mysql /var/lib/mysql
    chmod 755 /var/lib/mysql
    #init mariadb settings, --rmp install mode for linux based systems
    mysql_install_db --datadir=/var/lib/mysql --user=mysql --rpm
fi

if [ ! -d "/var/lib/mysql/wordpress" ]; then
    cat << EOF > /tmp/db.sql
# Delete test database
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS ${DB_NAME} ;
CREATE USER IF NOT EXISTS '${DB_ADMN}'@'%' IDENTIFIED BY '${DB_ADMNPWD}' ;
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_ADMN}'@'%' ;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USRPWD}' ;
GRANT SELECT, INSERT, UPDATE, DELETE ON ${DB_NAME}.* TO '${DB_USER}'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_RTPWD}' ;
FLUSH PRIVILEGES ;
EOF
# Execute SQL commands
mysql < /tmp/db.sql
fi
# Stop MySQL service
# service mysql stop
# Restart MySQL service
# service mysql start
# rc-service mariadb restart
# exec mysqld_safe --datadir=/var/lib/mysql
