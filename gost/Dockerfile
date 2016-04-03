FROM alpine:3.3
MAINTAINER sunteya <sunteya@gmail.com>

ADD build.sh /
RUN sh -x build.sh 2.0-rc3

ENTRYPOINT [ "/app/gost", "-logtostderr" ]
CMD [ "--help" ]
