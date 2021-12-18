#!/bin/sh

cp -r redis-cache/ /wordpress/wp-content/plugins/
# mkdir /var/www/html/wordpress
cp -r /wordpress/* /var/www/html/wordpress/
php-fpm7 -FR
