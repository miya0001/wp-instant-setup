#!/usr/bin/env bash

set -ex;

DB_NAME=wpdev
PORT=8080

WP_TITLE="Welcome to the WordPress"
WP_DESC="Hello World!"

echo "DROP DATABASE IF EXISTS wordpress;" | mysql -u root
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -u root

echo "WordPressをダウンロードします。"
wp core download --path=$(pwd) --locale=ja --force

echo "wp-config.phpを作成します。"
wp core config --dbhost=localhost --dbname=$DB_NAME --dbuser=root --dbprefix=wp_ --locale=ja --extra-php <<PHP
define( 'JETPACK_DEV_DEBUG', true );
define( 'WP_DEBUG', true );
PHP

echo "WordPressをセットアップします。"
wp core install \
--url=http://127.0.0.1:$PORT \
--title=$WP_TITLE \
--admin_user="admin" \
--admin_password="admin" \
--admin_email="admin@example.com"

echo "パーマリンク設定を変更します。"
wp rewrite structure "/archives/%post_id%"

echo "オプションを設定します。"
wp option update blogdescription $WP_DESC

echo "プラグインをインストールします。"
wp plugin install wp-multibyte-patch --activate
wp plugin install content-template-engine --activate

php -S 127.0.0.1:$PORT
