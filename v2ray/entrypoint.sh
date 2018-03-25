#!/usr/bin/env sh

set -x

if [ -e /app/config.json.tmpl ]; then
  envsubst < /app/config.json.tmpl > /app/config.json
fi

exec $@
