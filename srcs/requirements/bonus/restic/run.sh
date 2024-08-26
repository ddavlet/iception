export RESTIC_PASSWORD_FILE=/run/secrets/sr-secrets
if [ ! -f "/srv/restic-repo/config" ]; then
	restic init --repo /srv/restic-repo
	sleep 25
fi

while true; do
    restic -r /srv/restic-repo backup /var/data
    sleep 200
done

