FROM alpine:3.20.2

RUN apk update && apk upgrade && \
    apk add --no-cache restic tini

RUN mkdir -p /var/data/wordpress /var/data/mariadb

COPY run.sh /run/


ENTRYPOINT ["tini", "--"]

CMD ["/bin/sh", "/run/run.sh"]
