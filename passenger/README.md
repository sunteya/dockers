# sunteya/passenger

[Passenger](https://www.phusionpassenger.com/) is A Fast web server & app server, Ruby Python Node.js

The image base on [phusion/baseimage-docker](https://github.com/phusion/passenger-docker)

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/passenger/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/passenger)


## Usage

1. `/home/app/current/public` is default passenger root directory, you must deploy project provide this directory.

2. Run with docker compose
   
   ````yaml
   # docker-compose.yml
   
   passenger:
     image: sunteya/passenger:20160118-ruby22
     restart: always
     ports:
       - "80:80"
     volumes:
       - YOUR_PROJECT_PATH:/home/app/current
   ````

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request


