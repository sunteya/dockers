#!/bin/bash

cd /home/app/current
exec 2>&1
exec chpst -u app unicorn config.ru -E production
