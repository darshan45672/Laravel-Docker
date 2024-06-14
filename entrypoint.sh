#!/bin/sh

composer update

nginx

php-fpm82 -F -O -c /etc/php82/php.ini