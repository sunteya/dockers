set -x

apk update
apk add ca-certificates
apk add wget
apk add python3 git

mkdir /build
cd /build
wget https://pypi.python.org/packages/ff/d4/209f4939c49e31f5524fa0027bf1c8ec3107abaf7c61fdaad704a648c281/setuptools-21.0.0.tar.gz
tar xvfz setuptools-21.0.0.tar.gz
python3 setuptools-21.0.0/setup.py install

git clone https://github.com/shadowsocks/shadowsocks.git
cd shadowsocks
git checkout -b master origin/master
python3 setup.py install

rm -rf /var/cache/apk/*
rm -rf /build
