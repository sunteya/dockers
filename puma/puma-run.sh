#!/bin/bash

cd $APP_CURRENT_PATH
exec 2>&1
exec chpst -u app bundle exec puma -C config/puma.rb --environment production
