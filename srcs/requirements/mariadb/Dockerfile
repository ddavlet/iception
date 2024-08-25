# Use the Alpine base image for NGINX
FROM alpine:3.20.2

#Add environmental variables as arguments
ARG DB_NAME DB_USER DB_USRPWD DB_RTPWD

RUN apk update && apk add --no-cache mariadb mariadb-client tini bash\
	&& mkdir -p /var/lib/mysql /run/mysqld \
	&& {   echo '[mysqld]'; \
			echo 'skip-host-cache'; \
			echo 'skip-name-resolve'; \
			echo 'bind-address = 0.0.0.0'; \
		} | tee /etc/my.cnf.d/docker.cnf; \
		sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf

# Copy file to docker machine
COPY setup.sh /etc/

# Install MariaDB and necessary packages

RUN chmod +x /etc/setup.sh \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& chown -R mysql:mysql /run/mysqld \
	&& chmod -R 755 /var/lib/mysql \
	&& bash /etc/setup.sh

# Switch to mysql user
USER mysql

# Expose the MariaDB port
EXPOSE 3306

ENTRYPOINT ["/sbin/tini", "--"]

# Start MariaDB server
CMD ["/usr/bin/mysqld_safe", "--skip-log-error", "--datadir=/var/lib/mysql", "--user=mysql"]
