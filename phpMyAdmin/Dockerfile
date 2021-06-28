FROM  alpine:3.12.0

RUN apk update
RUN apk add nginx openrc
RUN apk add phpmyadmin php7-fpm
#php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
#	php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
#	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7 php7-fpm php7-opcache
# php-mbstring don't forget this

COPY src ./tmp/
RUN mkdir -p /var/www/localhost/htdocs
RUN mv /tmp/default.conf /etc/nginx/conf.d/
RUN openrc
RUN touch /run/openrc/softlevel

RUN sh tmp/php-setup.sh
ADD src/run.sh .
RUN chmod +x /run.sh


ENTRYPOINT [ "/run.sh" ]