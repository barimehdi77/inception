#!/bin/sh

# sh tmp/wp-setup.sh
cp -r /tmp/wordpress /var/www/html
rc-service php-fpm7 start

sleep 2

while true;
do
	sleep 2
done
