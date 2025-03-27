#!/bin/sh

# Check if wp-config.php already exists or is empty
if [ ! -f "/var/www/wp-config.php" ] || [ ! -s "/var/www/wp-config.php" ]; then
  echo "Creating wp-config.php..."
  
  # Validate environment variables
  if [ -z "$WORDPRESS_DB_NAME" ] || [ -z "$WORDPRESS_DB_USER" ] || [ -z "$WORDPRESS_DB_PASSWORD" ]; then
    echo "Error: Database credentials are missing!"
    exit 1
  fi

  cat > /var/www/wp-config.php << EOF
<?php
define( 'DB_NAME', '$WORDPRESS_DB_NAME' );
define( 'DB_USER', '$WORDPRESS_DB_USER' );
define( 'DB_PASSWORD', '$WORDPRESS_DB_PASSWORD' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define( 'FS_METHOD', 'direct' );
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
  define( 'ABSPATH', __DIR__ . '/' );
}
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
require_once ABSPATH . 'wp-settings.php';
EOF

  # Verify the file was created and is not empty
  if [ ! -s "/var/www/wp-config.php" ]; then
    echo "Failed to create wp-config.php"
    exit 1
  fi
fi

# Print out the DB configuration for debugging (optional)
echo "DB Configuration:"
grep "DB_" /var/www/wp-config.php

# Execute the original command
exec "$@"