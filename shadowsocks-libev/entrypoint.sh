#!/bin/sh
set -x
exec $SS_EXEC -s $SERVER_ADDR -p $SERVER_PORT -k ${PASSWORD:-$(hostname)} -m $METHOD -t $TIMEOUT -u "$@" 

