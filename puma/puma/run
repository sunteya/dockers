#!/bin/bash

cd $APP_CURRENT_PATH
exec 2>&1
exec chpst -u app bundle exec puma --config config/puma.rb \
                                   --environment production \
                                   --control "unix://$PWD/tmp/pids/pumactl.sock" \
                                   --state $PWD/tmp/pids/puma.state
