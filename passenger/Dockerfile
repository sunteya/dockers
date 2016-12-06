FROM phusion/passenger-customizable:0.9.19
MAINTAINER sunteya <sunteya@gmail.com>

RUN apt-get update # 20161206
RUN /pd_build/utilities.sh
RUN /pd_build/ruby-2.3.*.sh
RUN /pd_build/nodejs.sh

# Node
RUN npm install -g yarn

RUN apt-get install -y imagemagick libmagickwand-dev

# Timezone
RUN echo Asia/Shanghai > /etc/timezone
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# SSH
RUN sed 's/#ClientAliveInterval 0/ClientAliveInterval 60/' -i /etc/ssh/sshd_config
RUN rm -f /etc/service/sshd/down
EXPOSE 22

# fix logrotate broken
RUN sed -i 's/root syslog/root adm/g' /etc/logrotate.conf

# App
RUN passwd -u app
RUN usermod -a -G docker_env app
RUN apt-get install -y rsync

# Passenger and Nginx
RUN sed 's/www-data/app/' -i /etc/nginx/nginx.conf
ADD nginx-passenger.conf /etc/nginx/conf.d/passenger.conf
RUN rm -f /etc/nginx/sites-available/default
ADD nginx-site-default.conf /etc/nginx/sites-available/default
ADD logrotate-app.conf /etc/logrotate.d/app
RUN rm -f /etc/service/nginx/down

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
