FROM sunteya/passenger:20180517-ruby24
MAINTAINER sunteya <sunteya@gmail.com>

# Disable Passenger
RUN rm /etc/nginx/conf.d/passenger.conf


COPY nginx-site-default.conf /etc/nginx/sites-available/default
# RUN echo 1 > /etc/container_environment/RAILS_SERVE_STATIC_FILES
COPY runit /etc/service/puma

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
