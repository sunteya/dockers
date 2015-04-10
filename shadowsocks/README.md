# sunteya/shadowsocks

[shadowsocks](https://github.com/shadowsocks/shadowsocks) is a fast tunnel proxy that helps you bypass firewalls

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/shadowsocks/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/shadowsocks)


## Usage

* Run shadowsocks ssserver, it will generate a random password on start
   
   ````bash
   docker run -p 8388:8388 sunteya/shadowsocks
   ````

* Run shadowsocks ssserver with argments
   
   ````bash
   docker run -p 8388:8388 -e SS_ARGS="-k password -m aes-256-cfb" sunteya/shadowsocks
   ````

* Run shadowsocks ssserver with config file
   
   ````bash
   docker run -p 8388:8388 -v "shadowsocks.json:/etc/shadowsocks.json" sunteya/shadowsocks
   ````

* Run shadowsocks sslocal
   
   ````bash
   docker run -e SS_APP=sslocal -p "1080:1080" -v "shadowsocks.json:/etc/shadowsocks.json" sunteya/shadowsocks
   ````

* Runs the specified version of shadowsocks
   
   ````bash
   docker run sunteya/shadowsocks:2.6.8
   ````

* If you need a http proxy, you can use [sunteya/polipo](https://github.com/sunteya/dockers/tree/master/polipo) together.


## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
