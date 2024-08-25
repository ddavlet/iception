FROM alpine:3.20.2

ARG FTP_USR

RUN apk update && apk upgrade \
    && apk add --no-cache vsftpd tini

RUN mkdir -p /var/www/localhost/htdocs/wordpress \
    && adduser -h /var/www/localhost/htdocs/wordpress -s /bin/false -D ${FTP_USR} \
    && chown ${FTP_USR}:${FTP_USR} -R /var/www/localhost/htdocs/wordpress \
    # && passwd -d ${FTP_USR} \
    && adduser ${FTP_USR} root
    # && echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd \

COPY vsftpd.conf /etc/vsftpd/

EXPOSE 21

WORKDIR /var/www/localhost/htdocs/wordpress

ENTRYPOINT [ "tini", "--" ]

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
