#! /bin/sh
set -e

mkdir -p /usr/share/polipo/www/
mkdir -p /var/cache/polipo/

polipo_args=$(eval echo $@)
exec /app/polipo -c /app/config "$polipo_args"
