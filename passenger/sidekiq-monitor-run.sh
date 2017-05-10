#!/bin/bash

while inotifywait -e attrib $APP_CURRENT_PATH/tmp/restart.txt; do
	sv stop sidekiq
	sv start sidekiq
done
