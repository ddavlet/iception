FROM alpine:3.20.2

RUN apk update && apk upgrade && \
    apk add --no-cache restic tini dcron

RUN mkdir -p /var/data/wordpress /var/data/mariadb \
    && chmod 0777 -R /var/data/wordpress \
    && chmod 0777 -R /var/data/mariadb

COPY ./tools/run.sh /run/
COPY ./tools/cronset /etc/cron.d/

RUN chmod +x /run/run.sh

ENTRYPOINT ["tini", "--"]

CMD ["sh", "/run/run.sh"]
