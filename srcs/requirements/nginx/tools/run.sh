#!/bin/sh

# Create SSl certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${CERTS_NGINX_KEY} -out ${CERTS_NGINX_CRT} -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=Inception"

# Set the Database Credentials
sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /etc/nginx/nginx.conf
sed -i 's|CERTS_NGINX_CRT|'${CERTS_NGINX_CRT}'|g' /etc/nginx/nginx.conf
sed -i 's|CERTS_NGINX_KEY|'${CERTS_NGINX_KEY}'|g' /etc/nginx/nginx.conf

# Running This Command "nginx -g daemon off;" tells Nginx to stay in the foreground
nginx -g "daemon off;"