#!/bin/sh

# Load database credentials from the secrets file
. /run/secrets/db-secrets

# Check if MySQL/MariaDB is not installed
if [ ! -d "/var/lib/mysql/ibdata1" ]; then
    # Initialize MariaDB settings
    mysql_install_db --datadir=/var/lib/mysql --user=mysql
fi

# Start MariaDB in the background and wait for it to fully start
/usr/bin/mysqld_safe --skip-log-error --datadir=/var/lib/mysql --user=mysql &
sleep 5

# Create SQL commands file
cat << EOF > /tmp/db.sql
# Delete test database
DELETE FROM mysql.user WHERE User = '';
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS ${database_name};
CREATE USER IF NOT EXISTS '${user_name}'@'%' IDENTIFIED BY '${user_password}';
GRANT ALL PRIVILEGES ON ${database_name}.* TO '${user_name}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${root_password}';
FLUSH PRIVILEGES;
EOF

# Execute SQL commands
mysql < /tmp/db.sql

# Clean up
rm -f /tmp/db.sql

# Restart MariaDB

# Wait for MariaDB to fully start
wait
