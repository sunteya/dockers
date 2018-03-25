# sunteya/v2ray

[v2ray](https://www.v2ray.com/): A platform for building proxies to bypass network restrictions.

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/v2ray/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/v2ray)


## Usage

* Run v2ray with docker-compose

  v2ray.json.tmpl

   ````json
   {
     "inbound": {
       "port": 10086,
       "protocol": "vmess",
       "settings": {
         "clients": [{ "id": "${V2RAY_CLIENT_ID1}" }]
       }
     },
     "outbound": {
       "protocol": "freedom",
       "settings": {}
     }
   }
   ````

   docker-compose.yml

   ````yaml
   version: '3'
   services:
    v2ray:
      image: sunteya/v2ray:3.14
      volumes:
        - ./v2ray.json.tmpl:/app/config.json.tmpl
      ports:
        - "10086:10086"
      environment:
        - V2RAY_CLIENT_ID1=5e54798c-7720-4b35-89ff-539fde5392d8
   ````


## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
