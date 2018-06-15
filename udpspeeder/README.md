# sunteya/udpspeeder

[UDPspeeder](https://github.com/wangyu-/UDPspeeder) A Tunnel which Improves your Network Quality on a High-latency Lossy Link by using Forward Error Correction,for All Traffics(TCP/UDP/ICMP)

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/udpspeeder/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/udpspeeder)


## Usage

* Run udpspeeder on docker compose

   server docker-compose.yml

   ````yaml
   version: '3'
   services:
     udpspeeder:
       image: sunteya/udpspeeder:20180225.0
       restart: unless-stopped
       command: -s -r 127.0.0.1:8388 -l 0.0.0.0:4000 -f20:10 --mode 0
       network_mode: "host"
   ````

   client docker-compose.yml

   ````yaml
   version: '3'
   services:
     udpspeeder:
       image: sunteya/udpspeeder:20180225.0
       restart: unless-stopped
       command: -c -r ${SERVER_ADDR}:4000 -l 127.0.0.1:8388 -f20:10 --mode 0
       network_mode: "host"
   ````

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
