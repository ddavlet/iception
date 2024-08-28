#!/bin/sh
export RESTIC_PASSWORD_FILE=/run/secrets/sr-secrets
if [ ! -f "/srv/wordpress_backup/config" ]; then
	restic init --repo /srv/wordpress_backup
	sleep 25
fi

if [ ! -f "/srv/database_backup/config" ]; then
	restic init --repo /srv/database_backup
	sleep 25
fi

crond -f
