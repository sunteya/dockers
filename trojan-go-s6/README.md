# sunteya/trojan-s6

[trojan](https://github.com/trojan-gfw/trojanl) An unidentifiable mechanism that helps you bypass GFW.

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/trojan-s6/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/trojan-s6)


## Usage

* Run trojan-s6 on docker compose

   server docker-compose.yml

   ````yaml
   version: '3'
   services:
     trojan:
      image: sunteya/trojan-go-s6:v0.10.6
      restart: unless-stopped
      volumes:
        - ./log:/var/log/trojan-go
        - ./trojan-go.json:/etc/trojan-go/config.json
   ````

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
