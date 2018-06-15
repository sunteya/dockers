set -x 
docker_version=3.2.0
rm -rf src
git clone https://github.com/shadowsocks/shadowsocks-libev.git src
cd src 
git checkout -b v$docker_version v$docker_version
git submodule update --init --recursive
cd ..


cp src/docker/alpine/Dockerfile dockerfile.shadowsocks-libev
#sed -i '/apk del .build-deps/s/^/echo /' dockerfile.shadowsocks-libev
#sed -i '/rm -rf \/tmp\//s/^/echo /' dockerfile.shadowsocks-libev
sed -i 's/COPY . \/tmp\/repo/COPY .\/src \/tmp\/repo/' dockerfile.shadowsocks-libev
cat dockerfile.shadowsocks-libev dockerfile.simple-obfs > Dockerfile
docker build -t sunteya/shadowsocks-libev:${docker_version}-obfs .
rm -rf src
