#!/bin/sh
. /run/secrets/db-secrets

TIMESTAMP=$(date +"%Y%m%d%H%M")
BACKUP_DIR="/var/lib/mysql/backup/$TIMESTAMP"

mkdir -p "$BACKUP_DIR"

mariabackup --backup --datadir=/var/lib/mysql --target-dir="$BACKUP_DIR" --user=root --password=$root_password
mariabackup --prepare --target-dir="$BACKUP_DIR"
