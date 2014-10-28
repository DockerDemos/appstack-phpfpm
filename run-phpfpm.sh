#!/bin/bash

mkdir -p /var/log/php-fpm
chown -R apache.root /var/log/php-fpm

exec /usr/sbin/php-fpm -F
