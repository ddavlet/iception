#!/bin/sh
DB_NAME=$(cat /run/secrets/db_name)
DB_USER=$(cat /run/secrets/db_user)
DB_USRPWD=$(cat /run/secrets/db_usrpwd)
DB_RTPWD=$(cat /run/secrets/db_rtpwd)
DB_HOST=$(cat /run/secrets/db_host)
WP_DEBUG=$(cat /run/secrets/wp_debug)
WP_AUTH_KEY=$(cat /run/secrets/wp_auth_key)
WP_SECURE_AUTH_KEY=$(cat /run/secrets/wp_secure_auth_key)
WP_LOGGED_IN_KEY=$(cat /run/secrets/wp_logged_in_key)
WP_NONCE_KEY=$(cat /run/secrets/wp_nonce_key)
WP_AUTH_SALT=$(cat /run/secrets/wp_auth_salt)
WP_SECURE_AUTH_SALT=$(cat /run/secrets/wp_secure_auth_salt)
WP_LOGGED_IN_SALT=$(cat /run/secrets/wp_logged_in_salt)
WP_NONCE_SALT=$(cat /run/secrets/wp_nonce_salt)

cat << EOF > '/var/www/localhost/htdocs/wordpress/wp-config.php'
<?php
define('DB_NAME',          '$DB_NAME');
/** Database username */
define('DB_USER',          '$DB_USER');
/** Database password */
define('DB_PASSWORD',      '$DB_USRPWD');
/** Database hostname */
define('DB_HOST',          '$DB_HOST');
define('AUTH_KEY',         '$WP_AUTHKEY');
define('SECURE_AUTH_KEY',  '$WP_SECURE_AUTH_KEY');
define('LOGGED_IN_KEY',    '$WP_LOGGED_IN_KEY');
define('NONCE_KEY',        '$WP_NONCE_KEY');
define('AUTH_SALT',        '$WP_AUTH_SALT');
define('SECURE_AUTH_SALT', '$WP_SECURE_AUTH_SALT');
define('LOGGED_IN_SALT',   '$WP_LOGGED_IN_SALT');
define('NONCE_SALT',       '$WP_NONCE_SALT');
\$table_prefix = 'wp_';
define( 'WP_DEBUG',        'false');

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';

EOF
