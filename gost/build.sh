set -ex

version=$1
revision=$2

apk --no-cache --virtual .build-deps add wget ca-certificates
mkdir -p /build
cd /build
wget -O - https://github.com/ginuerzh/gost/releases/download/v${version}/gost-linux-amd64-${revision}.gz | gunzip > gost-linux-amd64-${revision}

mkdir -p /app
mv gost-linux-amd64-${revision} /app/gost
chmod +x /app/gost
rm -rf /build

apk del .build-deps
rm -rf /tmp/*
