#!/usr/bin/env bash

set -ex;

PORT=${1-8080}
DB_NAME=${2-wpdev}
WP_PATH=$(pwd)/public_html

if [ -e "$WP_PATH/wp-config.php" ]; then
    php -S 127.0.0.1:$PORT
    exit 0
fi

WP_TITLE="Welcome to the WordPress"
WP_DESC="Hello World!"

echo "DROP DATABASE IF EXISTS $DB_NAME;" | mysql -u root
echo "CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -u root

echo "WordPressをダウンロードします。"
wp core download --path=$WP_PATH  --locale=ja --force

echo "wp-config.phpを作成します。"
wp --path=$WP_PATH core config --dbhost=localhost --dbname=$DB_NAME --dbuser=root --dbprefix=wp_ --locale=ja --extra-php <<PHP
define( 'JETPACK_DEV_DEBUG', true );
define( 'WP_DEBUG', true );
PHP

echo "WordPressをセットアップします。"
wp --path=$WP_PATH core install \
--url=http://127.0.0.1:$PORT \
--title="$WP_TITLE" \
--admin_user="admin" \
--admin_password="admin" \
--admin_email="admin@example.com"

echo "パーマリンク設定を変更します。"
wp --path=$WP_PATH rewrite structure "/archives/%post_id%"

echo "オプションを設定します。"
wp --path=$WP_PATH option update blogdescription "$WP_DESC"

echo "プラグインをインストールします。"
wp --path=$WP_PATH plugin install wp-multibyte-patch --activate
wp --path=$WP_PATH plugin install content-template-engine --activate

php -S 127.0.0.1:$PORT -t $WP_PATH
