#!/bin/sh

echo "starting backup service every 7 minutes for mariadb database.."

while true;
do
	time=$(date '+%Y-%m-%d %H:%M:%S')
	backup_folder="backup_${time}"
	mkdir "/backup/$backup_folder"
	cp -Rf /db-data/* /backup/"${backup_folder}"
	echo "backup mariadb server at $time in $backup_folder"
	sleep 420
done

exit 0