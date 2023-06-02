FROM sunteya/passenger:2023-05-11-ruby32
MAINTAINER sunteya <sunteya@gmail.com>

# Disable Passenger
RUN rm /etc/nginx/conf.d/passenger.conf


COPY nginx-site-default.conf /etc/nginx/sites-available/default
# RUN echo 1 > /etc/container_environment/RAILS_SERVE_STATIC_FILES
RUN mkdir -p /etc/service/puma
COPY ./puma/ /etc/service/puma

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
