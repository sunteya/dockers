FROM alpine:3.3
MAINTAINER sunteya <sunteya@gmail.com>

COPY build.sh /
RUN sh -x build.sh # 20160403

COPY config /app/
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
EXPOSE 8123
