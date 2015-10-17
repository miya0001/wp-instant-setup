#!/usr/bin/env bash

set -ex;

DB_NAME=${1-wpdev}
PORT=8080
WP_PATH=$(pwd)/www

if [ -e "$WP_PATH/wp-config.php" ]; then
    php -S 127.0.0.1:$PORT -t $WP_PATH
    exit 0
fi

echo "Download wp-cli"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

echo "path: $WP_PATH" > $(pwd)/wp-cli.yml

WP_TITLE="Welcome to the WordPress"
WP_DESC="Hello World!"

echo "DROP DATABASE IF EXISTS $DB_NAME;" | mysql -u root
echo "CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -u root

php wp-cli.phar core download --path=$WP_PATH --locale=en_US --force

php wp-cli.phar core config --dbhost=localhost --dbname=$DB_NAME --dbuser=root --dbprefix=wp_ --locale=en_US --extra-php <<PHP
define( 'JETPACK_DEV_DEBUG', true );
define( 'WP_DEBUG', true );
PHP

php wp-cli.phar core install \
--url=http://127.0.0.1:$PORT \
--title="$WP_TITLE" \
--admin_user="admin" \
--admin_password="admin" \
--admin_email="admin@example.com"

php wp-cli.phar rewrite structure "/archives/%post_id%"

php wp-cli.phar option update blogdescription "$WP_DESC"

php wp-cli.phar theme install twentyfifteen --activate

php -S 127.0.0.1:$PORT -t $WP_PATH
