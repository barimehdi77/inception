cd /var/www/localhost/htdocs

wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
rm latest.tar.gz
mv /tmp/wp-config.php /var/www/localhost/htdocs/wordpress/wp-config.php
chown -R nginx:nginx /var/www/