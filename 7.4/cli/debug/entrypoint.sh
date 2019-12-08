#!/bin/bash

if [ "$PHP_DEBUG" == 1 ]
then
  echo "xdebug.idekey = PHPSTORM" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.default_enable = 1" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.remote_enable = 1" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.remote_autostart = 1" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.remote_connect_back = 0" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.profiler_enable = 0" >> /usr/local/etc/php/conf.d/20-xdebug.ini && \
  echo "xdebug.remote_host = 127.0.0.1" >> /usr/local/etc/php/conf.d/20-xdebug.ini
  
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
      sed -i "s/xdebug\.remote_host \=.*/xdebug\.remote_host\=$HOST/g" /usr/local/etc/php/conf.d/20-xdebug.ini
  fi

  if [ -f /etc/php/7.1/cli/conf.d/20-xdebug.ini ]
  then
      sed -i "s/xdebug\.remote_host \=.*/xdebug\.remote_host\=$HOST/g" /etc/php/7.0/cli/conf.d/20-xdebug.ini
  fi
else
  rm -rf /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi


exec $@
