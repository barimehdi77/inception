#!/bin/sh

echo "starting backup service every 7 minutes for mariadb database.."

while true;
do
	# take the current date
	time=$(date '+%Y-%m-%d %H:%M:%S')
	
	# Create new folder with the current date
	backup_folder="backup_${time}"
	mkdir "/backup/$backup_folder"
	
	# Copy the data from "db-data" to the backup Folder
	echo "backup mariadb server at $time in $backup_folder"
	cp -Rf /db-data/* /backup/"${backup_folder}"
	
	# sleep for 7 minutes
	sleep 7m
done

exit 0