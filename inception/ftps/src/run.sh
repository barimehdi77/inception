#!/bin/sh

adduser -D ${FTP_USER} && echo ${FTP_USER}:${FTP_PASS} | chpasswd
chown -R ${FTP_USER}:${FTP_USER} /home/"${FTP_USER}"

echo "ftps is running..."
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
