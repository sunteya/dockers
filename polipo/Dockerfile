FROM sunteya/baseimage:20150716
MAINTAINER sunteya <sunteya@gmail.com>

RUN apt-get update \
 && apt-get install -y polipo \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  # 20150716


RUN mv /etc/polipo/config /etc/polipo/config.dist
ADD polipo-config /etc/polipo/config

RUN mkdir -p /etc/service/polipo
ADD polipo-run.sh /etc/service/polipo/run
RUN chmod +x /etc/service/polipo/run

EXPOSE 8123
VOLUME /var/cache/polipo
