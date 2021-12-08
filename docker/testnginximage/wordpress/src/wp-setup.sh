cd /tmp

wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
rm latest.tar.gz
mv /tmp/wp-config.php /tmp/wordpress/wp-config.php
# adduser --uid 82 www-data
# chown -R www-data:www-data /var/www
