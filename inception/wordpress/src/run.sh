#!/bin/sh

# sh tmp/wp-setup.sh
mkdir /var/www/html/wordpress
cp -r /wordpress/* /var/www/html/wordpress/
# chown root:root /var/www/html/wordpress
php-fpm7 -FR

# sleep 2

# while true;
# do
# 	sleep 2
# done
