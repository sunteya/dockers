FROM postgres:9.6.5
MAINTAINER sunteya <sunteya@gmail.com>

RUN apt-get update \
 && apt-get install -y ca-certificates wget \
 && apt-get install -y tar make gcc \
 && apt-get install -y postgresql-server-dev-$PG_MAJOR \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV SCWS_VERSION 1.2.2
RUN mkdir -p /build \
 && cd /build \
 && wget -q -O - http://www.xunsearch.com/scws/down/scws-$SCWS_VERSION.tar.bz2 | tar xjf -  \
 && cd scws-$SCWS_VERSION && ./configure && make install \
 && rm -rf /build

ENV ZHPARSER_VERSION 0.2.0
RUN mkdir -p /build \
 && cd /build \
 && wget -q -O - https://github.com/amutu/zhparser/archive/v$ZHPARSER_VERSION.tar.gz | tar xzf - \
 && cd zhparser-$ZHPARSER_VERSION && SCWS_HOME=/usr/local make && make install \
 && rm -rf /build
