FROM alpine:3.3
MAINTAINER sunteya <sunteya@gmail.com>

RUN apk add privoxy=3.0.24-r0 --update && rm -rf /var/cahce/apk/*
RUN sed -i -e 's/^listen-address  127.0.0.1/listen-address  /' /etc/privoxy/config

ENTRYPOINT [ "/usr/sbin/privoxy", "--no-daemon" ]
CMD [ "/etc/privoxy/config" ]
EXPOSE 8118
