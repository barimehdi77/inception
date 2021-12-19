#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	rc-service mariadb start

	mysql -u ${MYSQL_ROOT_USER} < wordpress.sql

	echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
	# echo "CREATE DATABASE wordpress;" | mysql -u ${MYSQL_ROOT_USER}
	echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
	echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}

	echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
	echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
	echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}
	echo "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}'" | mysql -u ${MYSQL_ROOT_USER}
    echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER} -p'${MYSQL_ROOT_PASS}';
fi
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
rc-service mariadb stop
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid
