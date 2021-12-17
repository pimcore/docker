#!/bin/bash

interactive=$(if test -t 0; then echo true; else echo false; fi)
set -eux -o pipefail ${EXTRA_SHELL_OPTS-}
IFS=$'\n\t'

# Add www-data user
NEW_USER_ID=${USER_ID:-9001}
NEW_GROUP_ID=${GROUP_ID:-$NEW_USER_ID}

echo "Starting with user www-data id: $NEW_USER_ID and group id: $NEW_GROUP_ID"

if ! id -u www-data >/dev/null 2>&1; then
  if [ -z "$(getent group $NEW_GROUP_ID)" ]; then
    echo "Create group www-data with id ${NEW_GROUP_ID}"
    groupadd -g $NEW_GROUP_ID www-data
  else
    group_name=$(getent group $NEW_GROUP_ID | cut -d: -f1)
    echo "Rename group $group_name to www-data"
    groupmod --new-name www-data $group_name
  fi
  echo "Create user www-data with id ${NEW_USER_ID}"
  adduser -u $NEW_USER_ID --disabled-password --gecos '' --home "${OPENHAB_HOME}" --gid $NEW_GROUP_ID www-data
fi

PHP_DEBUG=${DEBUG:false}

if -z "$($PHP_DEBUG)"; then
  /usr/local/bin/docker-php-ext-enable xdebug

  cat << EOF > /usr/local/etc/php/conf.d/20-xdebug.ini
  xdebug.idekey = PHPSTORM
  xdebug.mode = debug
  xdebug.start_with_request = 1
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

  # if we manage to d to determine HOST add itthe xdebug config. Otherwise use xdebug's
  # default config.
  if [ -n "$HOST" ]; then
    echo "xdebug.client_host = $HOST" >> /usr/local/etc/php/conf.d/20-xdebug.ini
  fi
fi

# Set www-data folder permission
chown -R www-data:www-data "/var/www/html"
sync

exec docker-php-entrypoint "$@"
