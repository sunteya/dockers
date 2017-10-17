set -x
set -e

version=$1
revision=$2

apk add wget ca-certificates --update
wget -O - https://github.com/ginuerzh/gost/releases/download/v${version}/gost_${revision}_linux_amd64.tar.gz | tar xvz

mkdir -p /app
mv /gost_${revision}_linux_amd64/gost /app/gost
rm -rf /gost_${revision}_linux_amd64

apk del wget ca-certificates --purge
rm -rf /var/cahce/apk/*
