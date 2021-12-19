#!/bin/sh

cp -r redis-cache/ /wordpress/wp-content/plugins/
# mkdir /var/www/html/wordpress
sed -i 's/DOMAIN_NAME/${DOMAIN_NAME}/g' /wordpress/wp-config.php
sed -i 's/DATABASE_NAME/${DATABASE_NAME}/g' /wordpress/wp-config.php
sed -i 's/DATABASE_USER/${DATABASE_USER}/g' /wordpress/wp-config.php
sed -i 's/DATABASE_PASS/${DATABASE_PASS}/g' /wordpress/wp-config.php
sed -i 's/DATABASE_HOST/${DATABASE_HOST}/g' /wordpress/wp-config.php

cp -r /wordpress/* /var/www/html/wordpress/
php-fpm7 -FR
