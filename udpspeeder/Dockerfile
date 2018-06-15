FROM alpine:3.7
MAINTAINER sunteya <sunteya@gmail.com>

RUN mkdir /app \
 && cd /app \
 && wget https://github.com/wangyu-/UDPspeeder/releases/download/20180522.0/speederv2_binaries.tar.gz \
 && tar xvfz speederv2_binaries.tar.gz \
 && ls | grep -v speederv2_amd64 | xargs rm \
 && mv speederv2_amd64 speederv2

ENTRYPOINT [ "/app/speederv2" ]
