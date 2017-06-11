set -x 
docker_version=3.0.6
dockerfile_url=https://github.com/shadowsocks/shadowsocks-libev/raw/v$docker_version/docker/alpine/Dockerfile
curl -sSL -o dockerfile.shadowsocks-libev $dockerfile_url 
#sed -i '/apk del .build-deps/s/^/echo /' dockerfile.shadowsocks-libev
#sed -i '/rm -rf \/tmp\//s/^/echo /' dockerfile.shadowsocks-libev
cat dockerfile.shadowsocks-libev dockerfile.simple-obfs > Dockerfile
docker build -t sunteya/shadowsocks-libev:${docker_version}-obfs .
