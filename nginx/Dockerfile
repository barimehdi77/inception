FROM  alpine:3.12.0

RUN apk update
RUN apk add nginx openrc vim
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
	php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
	php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7 php7-fpm php7-opcache openssl

COPY src ./tmp/
RUN mkdir -p /var/www/localhost/htdocs

RUN cp /tmp/index.html /var/www/localhost/htdocs/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=ft_services"

RUN mv /tmp/default.conf /etc/nginx/conf.d/
RUN openrc
RUN touch /run/openrc/softlevel

ADD src/run.sh .
RUN chmod +x /run.sh


ENTRYPOINT [ "/run.sh" ]
