FROM phusion/passenger-customizable:0.9.27
MAINTAINER sunteya <sunteya@gmail.com>

RUN apt update # 20171206
RUN /pd_build/utilities.sh
#RUN apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
 && apt install -y nodejs \
 && npm install -g yarn
#RUN /pd_build/nodejs.sh

# Ruby
RUN /usr/local/rvm/bin/rvm remove ruby-2.3
RUN /pd_build/ruby-2.4.*.sh
#RUN gem install -V -N bundler

# Imagemagick
RUN apt install -y imagemagick libmagickwand-dev

# Timezone
RUN echo Asia/Shanghai > /etc/timezone \
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# SSH
RUN sed 's/#ClientAliveInterval 0/ClientAliveInterval 60/' -i /etc/ssh/sshd_config \
 && rm -f /etc/service/sshd/down
EXPOSE 22

# fix logrotate broken
RUN sed -i 's/root syslog/root adm/g' /etc/logrotate.conf

# App
ENV APP_CURRENT_PATH=/home/app/www/current
COPY 01_apply_app_current_path.sh /etc/my_init.d/
RUN passwd -u app \
 && usermod -a -G docker_env app \
 && apt install -y rsync

# Passenger and Nginx
RUN sed 's/www-data/app/' -i /etc/nginx/nginx.conf \
 && rm -f /etc/nginx/sites-available/default \
 && rm -f /etc/service/nginx/down
COPY nginx-passenger.conf /etc/nginx/conf.d/passenger.conf
COPY nginx-site-default.conf /etc/nginx/sites-available/default
COPY logrotate-app.conf /etc/logrotate.d/app

# Sidekiq (Disabled)
COPY sidekiq-monitor-run.sh /etc/service/sidekiq-monitor/run
COPY sidekiq-run.sh /etc/service/sidekiq/run
COPY sidekiq-finish.sh /etc/service/sidekiq/finish
RUN apt install -y inotify-tools \
 && chmod +x /etc/service/sidekiq-monitor/run \
 && chmod +x /etc/service/sidekiq/run \
 && chmod +x /etc/service/sidekiq/finish \
 && touch /etc/service/sidekiq-monitor/down \
 && touch /etc/service/sidekiq/down

# Utilities
RUN apt install -y vim inetutils-ping dnsutils fish

# Cleanup
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
