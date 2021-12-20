#!/bin/sh

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	rc-service mariadb start

	# Set up WordPress Database
	mysql -u ${MYSQL_ROOT_USER} < wordpress.sql

	# Create new user and Make The user GRANT ALL PRIVILEGES to all databases in loaclhosts
	echo "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
	echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
	echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}

	# Create new user and Make The user GRANT ALL PRIVILEGES on Wordpress database
	echo "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
	echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';" | mysql -u ${MYSQL_ROOT_USER}
	echo "FLUSH PRIVILEGES;" | mysql -u ${MYSQL_ROOT_USER}
	# Change Password For root user
    mysql -u ${MYSQL_ROOT_USER} -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';"
fi
# Comment skip-networking
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
rc-service mariadb stop

# Running This Command "/usr/bin/mariadbd" to stay running in the foreground
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid
