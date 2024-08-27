#!/bin/sh

# Load database credentials from the secrets file
. /run/secrets/db-secrets

# Check if MySQL/MariaDB is not installed
if [ ! -f "/var/lib/mysql/ibdata1" ]; then
    # Initialize MariaDB settings
    mysql_install_db --datadir=/var/lib/mysql --user=mysql
fi

chmod +x /etc/setup.sh \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& chown -R mysql:mysql /usr/lib/mariadb \
	&& chown -R mysql:mysql /run/mysqld \
	&& chmod -R 755 /var/lib/mysql \
	&& chmod -R 755 /usr/lib/mariadb \
	&& chmod -R 755 /run/mysqld/

# Start MariaDB in the background and wait for it to fully start
/usr/bin/mysqld_safe --datadir=/var/lib/mysql --user=mysql &
while ! mysqladmin ping --silent; do
    sleep 3
done

# Create SQL commands file
if [ ! -f "/tmp/db.sql" ]; then
	cat << EOF > /tmp/db.sql
# Delete test database
DELETE FROM mysql.user WHERE User = '';
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS $database_name;
CREATE USER IF NOT EXISTS '$user_name'@'%' IDENTIFIED BY '$user_password';
GRANT ALL PRIVILEGES ON $database_name.* TO '$user_name'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$root_password';
FLUSH PRIVILEGES;
EOF

mysql < /tmp/db.sql

fi

kill $(cat /var/lib/mysql/*.pid)

sleep 10

/usr/bin/mysqld_safe --datadir=/var/lib/mysql --user=mysql
