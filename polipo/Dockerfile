FROM alpine:3.5
MAINTAINER sunteya <sunteya@gmail.com>

RUN apk add --update --virtual .build-deps alpine-sdk \
 && mkdir /app \
 && git clone https://github.com/jech/polipo.git /build \
 && cd /build && make \
 && mv polipo config.sample /app \
 && cd - && rm -rf /build \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* # 20170419 

COPY config /app/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE 8123
