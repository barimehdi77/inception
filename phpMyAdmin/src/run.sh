#!/bin/sh

rc-service nginx start
rc-service php-fpm7 start

sleep 2

while true; 
do
	sleep 2
done 