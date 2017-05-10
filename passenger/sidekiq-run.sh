#!/bin/bash

cd /home/app/www/current
exec 2>&1
exec chpst -u app bundle exec sidekiq -e production -C config/sidekiq.yml -P tmp/pids/sidekiq.pid

