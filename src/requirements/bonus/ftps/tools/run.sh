#!/bin/sh

# Create a new user for FTP server
adduser -D ${FTP_USER} && echo ${FTP_USER}:${FTP_PASS} | chpasswd

# Change owner to home directory
chown -R ${FTP_USER}:${FTP_USER} /home/"${FTP_USER}"

echo "ftps is running..."

# Running This Command "/usr/sbin/vsftpd" make the service run in the foreground
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
