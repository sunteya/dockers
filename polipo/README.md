# sunteya/polipo

polipo is a caching web proxy

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/polipo/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/polipo)


## Usage

* Run polipo server
   
   ````bash
   docker run -p 8123:8123 sunteya/polipo
   ````

* Run polipo server with argments
   
   ````bash
   docker run -p 8123:8123  -e POLIPO_ARGS="socksParentProxy=\$SSLOCAL_PORT_1080_TCP_ADDR:1080" sunteya/polipo
   ````

* Run polipo server with config file
   
   ````bash
   docker run -p 8388:8388 -v "polipo-config:/etc/polipo/config" sunteya/polipo
   ````

* Example for run with [shadowsocks](https://github.com/sunteya/dockers/tree/master/shadowsocks) and [docker-compose](https://github.com/docker/compose)
   
   ```
   # docker-compose.yml
   
   sslocal:
     image: sunteya/shadowsocks:2.6.8
     restart: always
     volumes:
       - shadowsocks-sslocal.json:/etc/shadowsocks.json
     environment:
       - SS_APP=sslocal

   polipo:
     image: sunteya/polipo:20150408
     links: [ sslocal ]
     ports: [ "8123:8123" ]
     restart: always
     environment:
       - POLIPO_ARGS=socksParentProxy=$SSLOCAL_PORT_1080_TCP_ADDR:1080
   ```

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
