mysql -uroot -e "CREATE DATABASE wordpress;"
mysql -uroot -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost';"
mysql < /tmp/create_tables.sql
mysql -uroot -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'admin'@'localhost';"
mysql -uroot -e "FLUSH PRIVILEGES;"