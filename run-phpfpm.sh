#!/bin/bash

/config-ssmtp.sh

if [[ ! -d /var/log/php-fpm ]] ; then
  mkdir -p /var/log/php-fpm
fi
if [[ ! -f /var/log/php-fpm/error.log ]] ; then
  touch /var/log/php-fpm/error.log
fi

chown -R apache.root /var/log/php-fpm

exec /usr/sbin/php-fpm -F
