#!/bin/sh
mkdir /var/www/html/wordpress
cp -r /wordpress/* /var/www/html/wordpress/
php-fpm7 -FR
