# sunteya/udp2raw-tunnel

[udp2raw-tunnel](https://github.com/wangyu-/udp2raw-tunnel) A Tunnel which Turns UDP Traffic into Encrypted UDP/FakeTCP/ICMP Traffic by using Raw Socket,helps you Bypass UDP FireWalls(or Unstable UDP Environment)

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/udp2raw-tunnel/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/udp2raw-tunnel)


## Usage

* Run udp2raw-tunnel on docker compose

   server docker-compose.yml

   ````yaml
   version: '3'
   services:
     udpspeeder:
       image: sunteya/udp2raw-tunnel:20180225.0
       restart: unless-stopped
       command: -s -l 0.0.0.0:4001 -r 127.0.0.1:4000 -k pass --raw-mode faketcp -a
       cap_add:
         - NET_ADMIN
       network_mode: "host"
   ````

   client docker-compose.yml
   
   ````yaml
   version: '3'
   services:
     udp2raw:
       image: sunteya/udp2raw-tunnel:20180225.0
       restart: unless-stopped
       command: -c -r ${SERVER_ADDR}:4001 -l 127.0.0.1:4000 --raw-mode faketcp -a -k pass
       cap_add:
         - NET_ADMIN
       network_mode: "host"
   ````

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
