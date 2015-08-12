#!/bin/bash
set -e

SHADOWVPN_CONFIG_FILE=${SHADOWVPN_CONFIG_FILE:-/etc/shadowvpn/server.conf}

if [ ! -f "$SHADOWVPN_CONFIG_FILE" ]; then
	echo $SHADOWVPN_CONFIG_FILE not exist!!!
	exit 1
fi


default_password_holder="password=my_password"
if [ -n "$(cat $SHADOWVPN_CONFIG_FILE | grep $default_password_holder)" ]; then
	SHADOWVPN_PASSWORD=${SHADOWVPN_PASSWORD:-$(date +%s | sha256sum | base64 | head -c 12)}
	sed "s/$default_password_holder/password=$SHADOWVPN_PASSWORD/" -i $SHADOWVPN_CONFIG_FILE
	echo "$SHADOWVPN_CONFIG_FILE new password is $SHADOWVPN_PASSWORD"
fi

exec /usr/bin/shadowvpn -v -c $SHADOWVPN_CONFIG_FILE
