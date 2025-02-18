FROM phusion/passenger-customizable:3.0.7
LABEL maintainer="sunteya <sunteya@gmail.com>"

# ================
# Environment
# ================
RUN apt update \
 && apt install -y \
      tzdata sudo inotify-tools \
      imagemagick libmagickwand-dev \
      vim inetutils-ping dnsutils fish jq man-db net-tools rsync \
 && rm -rf /var/lib/apt/lists/*

# Node 20
RUN curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash - \
 && apt-get install -y nodejs \
 && npm install -g yarn pnpm

# Ruby 3.2
RUN /usr/local/rvm/bin/rvm remove ruby \
 && /pd_build/ruby-3.2.*.sh
# RUN gem update --system
# RUN ruby -r "fileutils" -e 'FileUtils.rm_rf Gem.default_specifications_dir'
# RUN gem install bundler

# Timezone
RUN echo Asia/Shanghai > /etc/timezone \
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 

# SSH
RUN sed 's/#ClientAliveInterval 0/ClientAliveInterval 60/' -i /etc/ssh/sshd_config \
 && rm -f /etc/service/sshd/down
EXPOSE 22

# Logrotate
RUN sed -i 's/root syslog/root adm/g' /etc/logrotate.conf \
 && dpkg-divert --add --rename --divert /etc/cron.hourly/logrotate /etc/cron.daily/logrotate

# ================
# Service
# ================
ADD ./service /etc/service
ADD ./my_init.d /etc/my_init.d
ADD ./logrotate.d /etc/logrotate.d
ADD ./nginx /etc/nginx

# App
RUN echo 1 > /etc/container_environment/RAILS_SERVE_STATIC_FILES
ENV APP_CURRENT_PATH=/home/app/www/current
RUN passwd -u app \
 && usermod -a -G docker_env app

# Nginx
RUN sed 's/www-data/app/' -i /etc/nginx/nginx.conf \
 && rm -f /etc/service/nginx/down
