#!/bin/sh

# adduser --uid 82 www-data
# chown -R www-data:www-data /var/www

cp /tmp/index.html /var/www/html/

rc-service nginx start
rc-service php-fpm7 start

sleep 2

while true;
do
	sleep 2
done
