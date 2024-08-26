#!/bin/sh

. /run/secrets/ftp-secrets

echo "$user:$password" | /usr/sbin/chpasswd

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
