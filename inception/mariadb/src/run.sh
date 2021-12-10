#!/bin/sh

rc-service mariadb restart
sh /tmp/db-setup.sh

while true;
do
	sleep 2
done
