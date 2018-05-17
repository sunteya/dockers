FROM ubuntu:latest
MAINTAINER sunteya <sunteya@gmail.com>

RUN apt update \
 && apt show nginx-extras \
 && apt install -y nginx-extras=1.14.0-0ubuntu1 \
 && apt clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
