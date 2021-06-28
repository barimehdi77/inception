#!/bin/sh

rc-service nginx start
rc-service php-fpm7 start
rc-service mariadb start

sleep 2

sh /tmp/db-setup.sh

sleep 2

while true; 
do
	sleep 2
done 