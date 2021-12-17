#!/bin/sh

adduser -D "mbari" && echo "mbari":"ftpsmbari" | chpasswd
ssh-keygen -A
chown -R "mbari":"mbari" /home/"mbari"

echo 'running ftps'
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf