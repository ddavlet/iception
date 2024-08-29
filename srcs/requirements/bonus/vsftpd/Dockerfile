FROM alpine:3.20.2

RUN apk update && apk upgrade \
    && apk add --no-cache vsftpd tini

ARG FTP_USR

RUN mkdir -p /var/www/localhost/htdocs/wordpress \
    && adduser -h /var/www/localhost/htdocs/wordpress -s /bin/false -D ${FTP_USR} \
    && chown ${FTP_USR}:${FTP_USR} -R /var/www/localhost/htdocs/wordpress \
    && adduser ${FTP_USR} root

COPY ./tools/vsftpd.conf /etc/vsftpd/
COPY ./tools/start.sh /run/

EXPOSE 21
EXPOSE 10000-10002

WORKDIR /var/www/localhost/htdocs/wordpress

ENTRYPOINT [ "tini", "--" ]

CMD ["sh", "/run/start.sh"]
