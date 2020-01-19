FROM phusion/passenger-customizable:1.0.8
MAINTAINER sunteya <sunteya@gmail.com>

RUN apt-get update # 20191023
RUN /pd_build/utilities.sh
RUN apt install -y sudo

# Node 10
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
 && apt-get install -y nodejs \
 && npm install -g yarn

# Ruby 2.6
RUN rm -rf /var/lib/apt/lists/*
RUN /usr/local/rvm/bin/rvm list
RUN /usr/local/rvm/bin/rvm remove ruby-2.5
RUN /pd_build/ruby-2.6.*.sh
RUN gem update --system
RUN gem install bundler

# Imagemagick
RUN apt-get install -y imagemagick libmagickwand-dev

# Timezone
RUN echo Asia/Shanghai > /etc/timezone \
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN apt-get install -y tzdata

# SSH
RUN sed 's/#ClientAliveInterval 0/ClientAliveInterval 60/' -i /etc/ssh/sshd_config \
 && rm -f /etc/service/sshd/down
EXPOSE 22

# Logrotate
RUN sed -i 's/root syslog/root adm/g' /etc/logrotate.conf
RUN dpkg-divert --add --rename --divert /etc/cron.hourly/logrotate /etc/cron.daily/logrotate

# App
ENV APP_CURRENT_PATH=/home/app/www/current
COPY 01_apply_app_current_path.sh /etc/my_init.d/
RUN passwd -u app \
 && usermod -a -G docker_env app \
 && apt-get install -y rsync

# Passenger and Nginx
RUN sed 's/www-data/app/' -i /etc/nginx/nginx.conf \
 && rm -f /etc/nginx/sites-available/default \
 && rm -f /etc/service/nginx/down
COPY nginx-passenger.conf /etc/nginx/conf.d/passenger.conf
COPY nginx-site-default.conf /etc/nginx/sites-available/default
COPY logrotate-app.conf /etc/logrotate.d/app

# Sidekiq (Disabled)
RUN apt-get install -y inotify-tools
COPY ./sidekiq-monitor/ /etc/service/sidekiq-monitor/
COPY ./sidekiq/ /etc/service/sidekiq/

# Utilities
RUN apt-get install -y vim inetutils-ping dnsutils fish jq man-db net-tools

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
