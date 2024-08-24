#!/bin/bash
cat << eof > /var/www/localhost/htdocs/wordpress/wp-config.php
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
define( 'WP_DEBUG',        'false');



if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
eof
