FROM sunteya/baseimage:20150716
MAINTAINER sunteya <sunteya@gmail.com>

RUN echo "deb http://shadowvpn.org/debian wheezy main" > /etc/apt/sources.list.d/shadowvpn.list

RUN apt-get update \
 && apt-get install -y --force-yes shadowvpn=0.2.0-1 \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  # 20150821

RUN mkdir -p /etc/service/shadowvpn
ADD shadowvpn-run.sh /etc/service/shadowvpn/run
RUN chmod +x /etc/service/shadowvpn/run
