#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	rc-service mariadb start

	echo "CREATE USER 'mbari'@'localhost' IDENTIFIED BY 'fatine';" | mysql -u root
	echo "CREATE DATABASE wordpress;" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON *.* TO 'mbari'@'localhost' IDENTIFIED BY 'fatine';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root

	echo "CREATE USER 'mbari'@'%' IDENTIFIED BY 'fatine';" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'mbari'@'%' IDENTIFIED BY 'fatine';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root
fi
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
rc-service mariadb stop
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid

# while true;
# do
# 	sleep 2
# done
