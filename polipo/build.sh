mkdir -p /build 
apk add --update alpine-sdk
git clone https://github.com/jech/polipo.git /build/polipo
cd /build/polipo && make
mkdir -p /app
mv /build/polipo/polipo /app
mv /build/polipo/config.sample /app
apk del --purge alpine-sdk
rm -rf /build
rm -rf /var/cahce/apk/*
