# sunteya/puma

[puma](http://puma.io/): A Ruby/Rack web server built for concurrency

The image base on [phusion/passenger-docker](https://github.com/phusion/passenger-docker)

* [Dockerfile](https://github.com/sunteya/dockers/blob/master/puma/Dockerfile)
* [Github Repo](https://github.com/sunteya/dockers/tree/master/puma)


## Usage


1. `/home/app/www/current` is default puma root directory, you must deploy project provide this directory.

2. Run with docker compose

   ````yaml
   # docker-compose.yml

   puma:
     image: sunteya/puma:20171206-ruby24
     restart: always
     ports:
       - "80:8080"
     volumes:
       - YOUR_PROJECT_PATH:/home/app/www/current
   ````

3. If you want to run on a path, you need to follow steps.

   ````yaml
   # 1. Append the following to 'docker-compose.yml'

   environment:
     RAILS_RELATIVE_URL_ROOT: /path
   ````

   ````ruby
   # 2. Change project's 'config.ru' file like this:

   require ::File.expand_path('../config/environment', __FILE__)

   if ENV['RAILS_RELATIVE_URL_ROOT']
     map ENV['RAILS_RELATIVE_URL_ROOT'] do
       run Rails.application
     end
   else
     run Rails.application
   end
   ````

## Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
