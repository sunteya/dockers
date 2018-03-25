set -ex

version=$1
revision=$2

apk --no-cache --virtual .build-deps add wget ca-certificates
wget -O - https://github.com/ginuerzh/gost/releases/download/v${version}/gost_${revision}_linux_amd64.tar.gz | tar xvz

mkdir -p /app
mv /gost_${revision}_linux_amd64/gost /app/gost
rm -rf /gost_${revision}_linux_amd64

apk del .build-deps
rm -rf /tmp/*
