version=$1

apk add go git --update
wget -O - https://github.com/ginuerzh/gost/archive/$version.tar.gz | gzip -d -c | tar xv
cd /gost-$version && GOPATH=$PWD GOBIN=$PWD/bin go get

mkdir -p /app
mv /gost-$version/bin/gost-$version /app/gost
rm -rf /gost-$version

apk del go git --purge
rm -rf /var/cahce/apk/*
