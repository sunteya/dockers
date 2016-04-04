# sunteya/privoxy

[privoxy](https://www.privoxy.org/) is a non-caching web proxy

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/privoxy/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/privoxy)


## Usage

* Run privoxy server

   ````bash
   docker run -p 8118:8118 sunteya/privoxy
   ````

* Run privoxy server with custom config file

   ````bash
   docker run -v $PWD/privoxy_config:/etc/privoxy/config sunteya/privoxy
   ````

* Run privoxy server with arguments

   ````bash
   docker run sunteya/polipo /path/to/privoxy/config
   ````

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
