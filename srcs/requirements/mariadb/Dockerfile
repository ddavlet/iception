# Use the Alpine base image for NGINX
FROM alpine:3.20.2

# Install MariaDB and necessary packages
RUN apk update && \
    apk add --no-cache mysql mysql-client

# Copy custom configuration files if needed (optional)
# COPY my.cnf /etc/mysql/my.cnf

# Expose the MariaDB port
EXPOSE 3306

COPY setup.sh .

RUN chmod +x setup.sh \
    && setup.sh \
    && rm setup.sh
# Initialize the database (optional, depends on your setup)
# COPY init-db.sh /docker-entrypoint-initdb.d/

# Start MariaDB server
CMD ["mysqld_safe"]
