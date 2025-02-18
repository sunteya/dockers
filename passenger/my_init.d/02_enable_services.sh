#!/bin/bash

# ENABLED_SERVICES="puma good_job sidekiq"

if [[ "$ENABLED_SERVICES" == *"good_job"* ]]; then
	rm -f /etc/service/good_job/down
	rm -f /etc/service/good_job/log/down
	rm -f /etc/service/good_job-monitor/down
fi

if [[ "$ENABLED_SERVICES" == *"sidekiq"* ]]; then
	rm -f /etc/service/sidekiq/down
	rm -f /etc/service/sidekiq/log/down
	rm -f /etc/service/sidekiq-monitor/down
fi

if [[ "$ENABLED_SERVICES" == *"puma"* ]]; then
	rm -f /etc/service/puma/down
	rm -f /etc/service/puma/log/down
	ln -sf /etc/nginx/sites-available/puma /etc/nginx/sites-available/default
fi

exit 0