#!/bin/bash

if [ "$PHP_DEBUG" == 1 ]
then
  echo "xdebug.idekey = PHPSTORM" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.mode = debug" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.start_with_request = 1" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.discover_client_host = 0" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.client_host = 127.0.0.1" >> /usr/local/etc/php/conf.d/20-xdebug.ini

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

  # xdebug config
  if [ -f /usr/local/etc/php/conf.d/20-xdebug.ini ]
  then
      sed -i "s/xdebug\.client_host \=.*/xdebug\.client_host\=$HOST/g" /usr/local/etc/php/conf.d/20-xdebug.ini
  fi

else
  rm -rf /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi


exec "$@"
