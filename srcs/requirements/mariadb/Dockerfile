# Use the Alpine base image for NGINX
FROM alpine:3.20.2

#Add environmental variables as arguments
ARG DB_NAME DB_ADMN DB_USER DB_USRPWD DB_ADMNPWD DB_RTPWD

# Install MariaDB and necessary packages
RUN apk update && apk add --no-cache mariadb mariadb-client tini

# Prepare neccessary directories
RUN mkdir -p /var/lib/mysql /run/mysqld
# && chown -R mysql:mysql /var/lib/mysql /run/mysqld \
# && chmod 750 /var/lib/mysql /run/mysqld

# Copy file to docker machine
COPY setup.sh /etc/

RUN {   echo '[mysqld]';\
        echo 'skip-host-cache';\
        echo 'skip-name-resolve';\
        echo 'bind-address = localhost'; \
    } | tee /etc/my.cnf.d/docker.cnf;\
    # 'tee' writes all echos to file and 'sed' changed line by values
    sed -i "s|skip-networking|skip-networking=0|g" \
        /etc/my.cnf.d/mariadb-server.cnf

# Run script
RUN chmod +x /etc/setup.sh && sh /etc/setup.sh && rm /etc/setup.sh

# Switch to mysql user
USER mysql

# Expose the MariaDB port
EXPOSE 3306

ENTRYPOINT ["/sbin/tini", "--"]

# Start MariaDB server
CMD ["/usr/bin/mysqld_safe", "--skip-log-error", "--datadir=/var/lib/mysql"]
