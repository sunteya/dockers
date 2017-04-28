# sunteya/shadowsocks-libev

libev port of shadowsocks <https://github.com/shadowsocks/shadowsocks-libev>

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/shadowsocks-libev/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/shadowsocks-libev)


## Usage

* Run shadowsocks ssserver, it will use hostname as password

   ````bash
   docker run -p 8388:8388 sunteya/shadowsocks-libev
   ````

* Run shadowsocks ssserver with environment

   ````bash
   docker run -p 8388:8388 -e PASSWORD=YOUR_PASSWORD -e METHOD=aes-256-cf sunteya/shadowsocks-libev
   ````

* Run shadowsocks ssserver with config file

   ````bash
   docker run -p 8388:8388 -v "shadowsocks.json:/etc/shadowsocks.json" sunteya/shadowsocks-libev -c /etc/shadowsocks.json
   ````

* Run shadowsocks sslocal

   ````bash
   docker run -e SS_APP=sslocal -p "1080:1080" sunteya/shadowsocks-libev -l 1080 -b 0.0.0.0
   ````

* Run shadowsocks sserver with obfs

   ````bash
   docker run -p 8388:8388 sunteya/shadowsocks-libev --plugin obfs-server --plugin-opts "obfs=http"
   ````

* Runs the specified version of shadowsocks-libev

   ````bash
   docker run sunteya/shadowsocks-libev:3.0.2-obfs
   ````

* If you need a http proxy, you can use [sunteya/polipo](https://github.com/sunteya/dockers/tree/master/polipo) together.


## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
