#!/bin/sh

cd /www/html/wordpress
wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/wordpress/adminer.php
# chown -R www-data:www-data /var/www/html/wordpress/adminer.php
chmod 755 /var/www/html/wordpress/adminer.php

while true; 
do
	sleep 2
done 