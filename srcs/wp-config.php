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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'aaaaa' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

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
define('AUTH_KEY',         'y%zQSd=XX0kz($lF^@vi-jgVNk9Xo)q@T:&2XMZ^)^r,xS;_0#6:+D-rZ)+l(W(8');
define('SECURE_AUTH_KEY',  't-f+6#!YN<`!to-OPx,p~2B=mtfu;uHAa9zg7]CPCahh4HJD>WW-)$0YP[.W3O))');
define('LOGGED_IN_KEY',    '+UR-%:l u5/zB46[3aJE!%:wIw]cSHMTr>J+%R;/lYh*TB#0Yuy} nc~2qI|a7B]');
define('NONCE_KEY',        '+(|83gPL1*|>iHzXY4Emd|e6t25Eo4edCT-&9u3O]9s[z6`-`fO+AIDBL0[[VWAw');
define('AUTH_SALT',        'p|K0wCA)Y<gS|Pkd@XMWRY?T^|U_-$E9X^&y-=)?k-c)Z|t:e.C6X]^tH_N@ea9c');
define('SECURE_AUTH_SALT', '*[Wp|MH-TUeZDHyTbV*Y a+Tpq)v5p-*q%t@%8b^GoX=CNwVZn*2it!@4698RGP%');
define('LOGGED_IN_SALT',   't*zm.26E+pr%Bhg&!>!]w#@<No3ZsVhhaIN~5 Tm!, u>9W8g(jW;d_vCe+k !Ko');
define('NONCE_SALT',       'ktzfmK4d<XbZBmabT6Q}Svd^svc0B83D^N}bpJS}|,=^=.<iH3HaV=l1mNY/s<Ri');

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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
