FROM python:3-alpine
MAINTAINER sunteya <sunteya@gmail.com>

ADD build.sh /
RUN sh -x build.sh # 20160523

ADD shadowsocks-run.sh /
RUN chmod +x /shadowsocks-run.sh

EXPOSE 8388
EXPOSE 1080

ENTRYPOINT [ "/shadowsocks-run.sh" ]
