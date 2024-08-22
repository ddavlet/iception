<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
// define( 'DB_NAME', getenv('DB_NAME') );

// /** Database username */
// define( 'DB_USER', getenv('DB_ADMN') );

// /** Database password */
// define( 'DB_PASSWORD', getenv('DB_ADMNPWD') );

// /** Database hostname */
// define( 'DB_HOST', getenv('DB_HOST') );

// /** Database charset to use in creating database tables. */
// define( 'DB_CHARSET', 'utf8' );

// /** The database collate type. Don't change this if in doubt. */
// define( 'DB_COLLATE', '' );


define( 'DB_NAME', 'sql_db');

/** Database username */
define( 'DB_USER', 'ddavlety' );

/** Database password */
define( 'DB_PASSWORD', 'myP@ss1331' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'SNax~eH%%?|md5V;EJnQ}QG/WqmRGgbd>%`!0V=@(uR%r4oeCA*33m d~8 <#YzT');
define('SECURE_AUTH_KEY',  'ddU#B$_h(odh1xhr6TxGNSQ[@Wkz0!tx-<)}i`-?lEe/-]HS`sil+L|rJ*<]`cSg');
define('LOGGED_IN_KEY',    'QGItKu<YN3O_%FWKa#5&4sf< 9@U%-a8ixA+$sy8ZI2noEqC[#sovA&quy{DL^KC');
define('NONCE_KEY',        '^x7q04O:aQp2._E?g,<.@N:@|<@-0-D26&yd il*E|c%WVl],2j8vC! |M,N*R3J');
define('AUTH_SALT',        '2iCK-YAvdkRCyU:YDMXAbe<LM}GZn0*haUA5|{{E`^>a8xXPZix&sn3X]UG|XvVg');
define('SECURE_AUTH_SALT', 'b$cA48|WI/j-Zq?R,<$ir.F0G:L&fC@RkJLazC[l@=qwX`RH|QmH=xXD5@>l_>&U');
define('LOGGED_IN_SALT',   '|=>PN@w&{V8V-bBbKkkN);D>])U<;$^ K-ix.$d+H1Jmj8=Uua8zLBU&@L>oM@nZ');
define('NONCE_SALT',       '>zgn8?sO>{+sn3%dEmwxnW -&yACt|2E-&4/D@W pD@ZFauq[+AK?xg0|t`VnB>N');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', getenv('WP_DEBUG') );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
