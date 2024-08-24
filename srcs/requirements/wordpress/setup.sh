#!/bin/bash

# Load the secrets from the files
source /run/secrets/wp-secrets
source /run/secrets/db-secrets

# Create the wp-config.php file
cat << eof > /var/www/localhost/htdocs/wordpress/wp-config.php
<?php
define('DB_NAME',          '$database_name');
/** Database username */
define('DB_USER',          '$user_name');
/** Database password */
define('DB_PASSWORD',      '$user_password');
/** Database hostname */
define('DB_HOST',          '$database_host');
define('AUTH_KEY',         '$auth_key');
define('SECURE_AUTH_KEY',  '$secure_auth_key');
define('LOGGED_IN_KEY',    '$logged_in_key');
define('NONCE_KEY',        '$nonce_key');
define('AUTH_SALT',        '$auth_salt');
define('SECURE_AUTH_SALT', '$secure_auth_salt');
define('LOGGED_IN_SALT',   '$logged_in_salt');
define('NONCE_SALT',       '$nonce_salt');
\$table_prefix = 'wp_';
define( 'WP_DEBUG',        'false');

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
eof

php-fpm83 -F
