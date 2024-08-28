# Use the Alpine base image for MariaDB
FROM alpine:3.20.2

# Install MariaDB and necessary packages
RUN apk update && apk add --no-cache mariadb mariadb-client tini dcron \
	&& mkdir -p /var/lib/mysql /run/mysqld \
	&& {   echo '[mysqld]'; \
			echo 'skip-host-cache'; \
			echo 'skip-name-resolve'; \
			echo 'bind-address = 0.0.0.0'; \
		} | tee /etc/my.cnf.d/docker.cnf; \
		sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf

# Copy file to docker machine
COPY setup.sh /etc/
COPY backup.sh /etc/
COPY cronset /etc/cron.d/

# Set up directories
RUN chmod +x /etc/setup.sh \
	&& mkdir /var/lib/mysql/backup \
	&& chmod +x /etc/backup.sh \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& chown -R mysql:mysql /usr/lib/mariadb \
	&& chown -R mysql:mysql /run/mysqld \
	&& chmod -R 755 /var/lib/mysql \
	&& chmod -R 755 /usr/lib/mariadb \
	&& chmod -R 755 /run/mysqld/

# Expose the port of MariaDB
EXPOSE 3306

# Set entrypoint PID 1 as tini
ENTRYPOINT ["tini", "--"]

# Run starting up script
CMD ["sh", "/etc/setup.sh"]
