FROM sunteya/passenger:20180823-ruby25
MAINTAINER sunteya <sunteya@gmail.com>

# Disable Passenger
RUN rm /etc/nginx/conf.d/passenger.conf


COPY nginx-site-default.conf /etc/nginx/sites-available/default
# RUN echo 1 > /etc/container_environment/RAILS_SERVE_STATIC_FILES
RUN mkdir -p /etc/service/puma
COPY puma-run.sh /etc/service/puma/run
RUN chmod +x /etc/service/puma/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
