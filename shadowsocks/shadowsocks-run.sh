#!/bin/sh
set -e

SS_APP=${SS_APP:-ssserver}
SS_ARGS=${SS_ARGS}

if [ -f /etc/shadowsocks.json ]; then
	SS_ARGS="$SS_ARGS -c /etc/shadowsocks.json"
fi

if [ -z "$SS_ARGS" ]; then
	SS_PASSWORD=${SS_PASSWORD:-$(date +%s | sha256sum | base64 | head -c 12)}
	SS_ARGS="$SS_ARGS -k $SS_PASSWORD"
fi

echo Starting shadowshocks use command: $SS_APP $SS_ARGS
exec $SS_APP $SS_ARGS
