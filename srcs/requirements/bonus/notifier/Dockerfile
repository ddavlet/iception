FROM alpine:3.20.2

RUN apk update && apk upgrade && \
    apk add --no-cache python3 py3-pip

COPY ./tools/requirements.txt /run/requirements.txt
COPY ./tools/main.py /run/main.py

WORKDIR /run

RUN python3 -m venv /run/.venv && \
    source /run/.venv/bin/activate && \
    pip install -r /run/requirements.txt

CMD [ "/run/.venv/bin/python3", "main.py" ]
