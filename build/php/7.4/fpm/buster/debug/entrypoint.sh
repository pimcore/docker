#!/bin/bash

#
# NOTE: THIS DOCKERFILE IS GENERATED VIA update.sh
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

# Override default configuration for xdebug v2.x
# See: https://2.xdebug.org/docs/all_settings
cat << EOF > /usr/local/etc/php/conf.d/20-xdebug.ini
xdebug.idekey = PHPSTORM
xdebug.remote_enable = 1
xdebug.remote_autostart = 1
EOF

# if XDEBUG_HOST is manually set
HOST="$XDEBUG_HOST"

# else if check if is Docker for Mac
if [ -z "$HOST" ]; then
  HOST=`getent hosts docker.for.mac.localhost | awk '{ print $1 }'`
fi

# else get host ip
if [ -z "$HOST" ]; then
  HOST=`/sbin/ip route|awk '/default/ { print $3 }'`
fi

# if we managed to determine HOST add it to the xdebug config. Otherwise use xdebug's
# default config.
if [ -n "$HOST" ]; then
  echo "xdebug.remote_host = $HOST" >> /usr/local/etc/php/conf.d/20-xdebug.ini
fi

exec docker-php-entrypoint "$@"
