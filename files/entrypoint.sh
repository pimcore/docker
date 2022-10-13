#!/bin/bash

# Override default configuration for xdebug v3.x.
# See: https://xdebug.org/docs/all_settings
cat << EOF > /usr/local/etc/php/conf.d/20-xdebug.ini
xdebug.idekey = PHPSTORM
xdebug.mode = debug
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
  echo "xdebug.client_host = $HOST" >> /usr/local/etc/php/conf.d/20-xdebug.ini
fi

exec docker-php-entrypoint "$@"