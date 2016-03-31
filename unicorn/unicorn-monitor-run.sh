#!/bin/bash

[ -e /home/app/current/tmp/restart.txt ] || touch /home/app/current/tmp/restart.txt

while inotifywait -e attrib /home/app/current/tmp/restart.txt; do
	sv stop unicorn
	sv start unicorn
done
