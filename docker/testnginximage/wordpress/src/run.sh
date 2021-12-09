#!/bin/sh

# sh tmp/wp-setup.sh
cp -r /tmp/wordpress /var/www/html
# chown root:root /var/www/html/wordpress
rc-service php-fpm7 start

sleep 2

while true;
do
	sleep 2
done
