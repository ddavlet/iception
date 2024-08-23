#!/bin/sh

#if mysql (settings folder for mariadb) is not installed
if [ ! -d "/var/lib/mysql/ibdata1" ]; then
    #set owenership of the folder
    chown -R mysql:mysql /var/lib/mysql
	chown -R mysql:mysql /run/mysqld
    chmod 755 /var/lib/mysql
    #init mariadb settings, --rmp install mode for linux based systems
    mysql_install_db --datadir=/var/lib/mysql --user=mysql
fi

# Start MariaDB on background + wait to start
/usr/bin/mysqld_safe --datadir=/var/lib/mysql --user=mysql &
sleep 5  # Wait for MariaDB to fully start


if [ ! -d "/var/lib/mysql/wordpress" ]; then
    cat << EOF > /tmp/db.sql
# Delete test database
DELETE FROM mysql.user WHERE User = '';
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS ${DB_NAME} ;
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USRPWD}' ;
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_RTPWD}' ;
FLUSH PRIVILEGES ;
EOF
# Execute SQL commands
mysql < /tmp/db.sql
rm -f /tmp/db.sql
fi
# Stop MySQL service
# service mysql stop
# Restart MySQL service
# service mysql start
# rc-service mariadb restart
# exec mysqld_safe --datadir=/var/lib/mysql
