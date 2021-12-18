#!/bin/sh

adduser -D "mbari" && echo "mbari":"ftpsmbari" | chpasswd
chown -R "mbari":"mbari" /home/mbari

echo "ftps is running..."
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
