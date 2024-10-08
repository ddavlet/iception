FROM alpine:3.20.2

# ARG DB_NAME DB_HOST DB_USER DB_USRPWD DB_RTPWD WP_AUTHKEY \
#     WP_SECURE_AUTH_KEY WP_LOGGED_IN_KEY WP_NONCE_KEY WP_AUTH_SALT \
#     WP_SECURE_AUTH_SALT WP_LOGGED_IN_SALT WP_NONCE_SALT WP_DEBUG

# Install PHP, required extensions, and tini
RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-session \
    php83-gd \
    php83-intl \
    php83-zlib \
    php83-xml \
    php83-json \
    php83-curl \
    php83-mbstring \
    php83-zip \
    libzip \
    tini \
    curl

# Download and unpack WordPress
RUN curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz \
    && mkdir -p /var/www/localhost/htdocs/wordpress \
    && tar -xzvf /tmp/wordpress.tar.gz -C /var/www/localhost/htdocs/wordpress --strip-components=1 \
    && rm /tmp/wordpress.tar.gz

# Copy configuration files
COPY ./tools/php-fpm.conf /etc/php83/php-fpm.conf
# COPY www.conf /etc/php83/php-fpm.d/www.conf
COPY ./tools/setup.sh /tmp/

# Set proper permissions for WordPress
RUN adduser --system --ingroup www-data www-data \
    && chown -R www-data:www-data /var/www/localhost/htdocs/wordpress \
	&& chmod -R 755 /var/www/localhost/htdocs/wordpress \
    && mkdir -p /var/log/php-fpm /run/php \
    && touch /var/log/php-fpm/error.log && touch /run/php/php-fpm.pid \
    && chmod +x /tmp/setup.sh \
    # && /bin/bash /tmp/setup.sh \
    && chmod -R 755 /var/www/localhost/htdocs/wordpress/wp-content
    # && mv /tmp/wp-config.php /var/www/localhost/htdocs/wordpress/wp-config.php
	# && rm setup.sh
	# && chmod 440 /var/www/localhost/htdocs/wordpress/wp-config.php

# Set the working directory
WORKDIR /var/www/localhost/htdocs/wordpress

# Expose the PHP-FPM port
EXPOSE 9000

# Set tini as the entry point
ENTRYPOINT ["/sbin/tini", "--"]

# Define the healthcheck

# Start PHP-FPM
CMD ["/tmp/setup.sh"]
