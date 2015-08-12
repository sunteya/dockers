# sunteya/shadowsocks

[ShadowVPN](https://github.com/clowwindy/ShadowVPN) is A fast, safe VPN based on libsodium

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/shadowvpn/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/shadowvpn)


## Usage

* Run shadowvpn server, it will generate a random password on start
   
   ````bash
   docker run -p 1123:1123/udp --device=/dev/net/tun --cap-add=NET_ADMIN sunteya/shadowvpn
   ````

* Run shadowvpn server with custom password
   
   ````bash
   docker run -e SHADOWVPN_PASSWORD=password -p 1123:1123/udp --device=/dev/net/tun --cap-add=NET_ADMIN sunteya/shadowvpn
   ````

* Run shadowvpn client with custom config file
   
   ````bash
   docker run -e SHADOWVPN_CONFIG_FILE=/etc/shadowvpn/client.conf -v "shadowvpn-client.conf:/etc/shadowvpn/client.conf" --device=/dev/net/tun --cap-add=NET_ADMIN sunteya/shadowvpn
   ````

* Run shadowvpn on docker compose
   
   ````yaml
   # docker-compose.yml
   
   server:
     image: sunteya/shadowvpn:0.1.7-1
     restart: always
     ports:
       - "1123:1123/udp"
     environment:
       - SHADOWVPN_PASSWORD=password
     devices:
       - /dev/net/tun
     cap_add:
       - NET_ADMIN
   
   client:
     image: sunteya/shadowvpn:0.1.7-1
     restart: always
     environment:
       - SHADOWVPN_CONFIG_FILE=/etc/shadowvpn/client.conf
     volumes:
       - shadowvpn-client.conf:/etc/shadowvpn/client.conf
     devices:
       - /dev/net/tun
     cap_add:
       - NET_ADMIN
   ````


## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request


