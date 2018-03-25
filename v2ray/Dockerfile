FROM alpine:3.7
MAINTAINER sunteya <sunteya@gmail.com>

RUN set -ex \
 && apk add --no-cache gettext \
 && apk add --no-cache --virtual .build-deps wget ca-certificates unzip bash \
 && wget https://github.com/v2ray/v2ray-core/releases/download/v3.14/v2ray-linux-64.zip \
 && unzip v2ray-linux-64.zip \
 && rm v2ray-linux-64.zip \
 && mv /v2ray-v3.14-linux-64 /app \
 && apk del .build-deps \
 && rm -rf /tmp/*

ADD entrypoint.sh /app/

ENTRYPOINT [ "/app/entrypoint.sh" ]
CMD [ "/app/v2ray", "-config", "/app/config.json" ]
