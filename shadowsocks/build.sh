set -x

apk update
apk add ca-certificates git

mkdir /build
cd /build

git clone https://github.com/shadowsocks/shadowsocks.git
cd shadowsocks
git checkout -b master origin/master
python setup.py install

rm -rf /var/cache/apk/*
rm -rf /build
