#!/bin/bash
set -e

if [ -n "$POLIPO_ARGS" ]; then
	POLIPO_ARGS=$(eval echo "$POLIPO_ARGS")
fi

echo Starting polipo use command: polipo $POLIPO_ARGS
exec polipo $POLIPO_ARGS
