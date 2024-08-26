FROM alpine:3.20.2

RUN apk update && apk upgrade && \
	apk add --no-cache tini \
	wget \
    nginx \
    php83-fpm \
    php83 \
    php83-mysqli \
    php83-session \
    php83-json

RUN mkdir -p /var/www/localhost/htdocs/adminer && \
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php && \
	mv adminer-4.8.1-mysql-en.php /var/www/localhost/htdocs/adminer/index.php && \
	chown root:root -R /var/www/localhost/htdocs/adminer && \
	chmod 0777 -R /var/www/localhost/htdocs/adminer

WORKDIR /var/www/localhost/htdocs/adminer

EXPOSE 8080

ENTRYPOINT ["tini", "--"]

CMD ["php", "-S", "0.0.0.0:8080", "/var/www/localhost/htdocs/adminer/index.php"]
