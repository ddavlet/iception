all: secrets up


# env:
# 	include ./srcs/.env
# 	export


secrets:
	mkdir -p secrets

	echo "${DB_NAME}" > secrets/db_name.txt
	echo "${DB_USER}" > secrets/db_user.txt
	echo "${DB_USRPWD}" > secrets/db_usrpwd.txt
	echo "${DB_RTPWD}" > secrets/db_rtpwd.txt
	echo "${WP_DEBUG}" > secrets/wp_debug.txt
	echo "${WP_AUTHKEY}" > secrets/wp_authkey.txt
	echo "${WP_SECURE_AUTH_KEY}" > secrets/wp_secure_auth_key.txt
	echo "${WP_LOGGED_IN_KEY}" > secrets/wp_logged_in_key.txt
	echo "${WP_NONCE_KEY}" > secrets/wp_nonce_key.txt
	echo "${WP_AUTH_SALT}" > secrets/wp_auth_salt.txt
	echo "${WP_SECURE_AUTH_SALT}" > secrets/wp_secure_auth_salt.txt
	echo "${WP_LOGGED_IN_SALT}" > secrets/wp_logged_in_salt.txt
	echo "${WP_NONCE_SALT}" > secrets/wp_nonce_salt.txt

up:
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/mariadb
	chmod -R 777 /home/${USER}/data/
	# docker stack deploy -c srcs/docker-compose.yml inception
	docker compose -f srcs/docker-compose.yml up --build
	docker volume create wp-data
down:
	docker compose -f srcs/docker-compose.yml down
clean: down
	docker system prune -af
	docker volume prune -af
	rm -rf /home/${USER}/data

re: clean up
