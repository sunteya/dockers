FROM sunteya/passenger:20160118-ruby22
MAINTAINER sunteya <sunteya@gmail.com>

# Disable Passenger
RUN touch /etc/service/nginx/down

RUN apt-get update
RUN apt-get install -y inotify-tools
RUN gem install unicorn -V

RUN echo 1 > /etc/container_environment/RAILS_SERVE_STATIC_FILES
RUN mkdir -p /etc/service/unicorn
ADD unicorn-run.sh /etc/service/unicorn/run
RUN chmod +x /etc/service/unicorn/run

RUN mkdir -p /etc/service/unicorn-monitor
ADD unicorn-monitor-run.sh /etc/service/unicorn-monitor/run
RUN chmod +x /etc/service/unicorn-monitor/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
