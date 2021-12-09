#!/bin/sh

# adduser --uid 82 www-data
# chown -R www-data:www-data /var/www


rc-service nginx start


sleep 2

while true;
do
	sleep 2
done
