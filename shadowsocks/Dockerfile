FROM sunteya/baseimage:20150403
MAINTAINER sunteya <sunteya@gmail.com>

RUN apt-get update \
 && apt-get install -y python3-pip \
 && pip3 install shadowsocks==2.6.8 \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  # 20150408

RUN mkdir -p /etc/service/shadowsocks
ADD shadowsocks-run.sh /etc/service/shadowsocks/run
RUN chmod +x /etc/service/shadowsocks/run

EXPOSE 8388
EXPOSE 1080
