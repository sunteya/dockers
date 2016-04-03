# sunteya/gost

[gost](https://github.com/ginuerzh/gost) is a simple tunnel written in golang.

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/gost/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/gost)


## Usage

* Run gost with arguments

   ````bash
   docker run -p 8080:8080 sunteya/gost -L=:8080 -v=3
   ````

* Run gost with tls certificate files

   ````bash
   docker run -v "$PWD/cert.pem:/app/cert.pem" -v "$PWD/key.pem:/app/key.pem" sunteya/gost -L=tls://:8080
   ````

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
