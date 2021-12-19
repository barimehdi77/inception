<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

define('NONCE_SALT', 'DarkSide77');

define('WP_CACHE', true);

define('WP_REDIS_HOST', 'redis');
define('WP_CACHE_KEY_SALT', 'DOMAIN_NAME');

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'DATABASE_NAME' );

/** MySQL database username */
define( 'DB_USER', 'DATABASE_USER' );

/** MySQL database password */
define( 'DB_PASSWORD', 'DATABASE_PASS' );

/** MySQL hostname */
define( 'DB_HOST', 'DATABASE_HOST' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '28(QK6<_pU*gGqK05v90I@q5eHx|j e(&KX(HsEXMIz4O(,101x.{hm_87]Sn(,/');
define('SECURE_AUTH_KEY',  'U_6QMr#%}BZ-5;:S$FGiGpC.iaFnq?v]940w4KAh(s|aA?FYy`4V2ir2-y#(el4O');
define('LOGGED_IN_KEY',    'UswgJo+-7ETI~KZ+xHO#sd_ckVM-Pf.w/>r1>#o:(_`Y)k7gb2hsije+B#Q-T#q,');
define('NONCE_KEY',        ',)tk,YDOE|}&c.p6OP] ^UXb,ZG50=80_i83+#@B*5UCB?BN3YgjUy8~ *f65+24');
define('AUTH_SALT',        '*J)K,Fu[N_du:NN}<B.(f| (pxUaK-td+83IG`hg7y?7_]97r/S%=}h5}O5+^W*0');
define('SECURE_AUTH_SALT', '?h6bhmTG.G%!g?t+scy(9;|+s z>-s B`@iK|v#oDBUqt99+;#[+frxdw%Zrar0Q');
define('LOGGED_IN_SALT',   'l_@Xv~-&[|B[ jRd[g+97==tI+FF0*2Rrg$+yg7Ku|{@am&(Ulx||(+fMNvh2{+D');
define('NONCE_SALT',       'kqAiOSvoEo-T~<:-uWV=R;%G&skl} Kn8o+LsK9Z,+Pic%up]MC>=z5( [e&SFw?');

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
