# WordPress Installer on your desktop.

* このシェルスクリプトは2015年10月17日のWordBench大阪でのデモ用に作りました。
* PHPのビルトインサーバーとWP-CLIを使って任意のディレクトリにWordPressをインストールして起動します。
* たぶん、現存する方法で最も簡単にWordPress環境を構築する方法です。笑

## Requires

* php 5.4 or later
* MySQL
* wp-cli

### How to setup

```
$ brew install php56 wp-cli mysql && mysql.server start
```

## How to use

Create a working directory and move into it.

```
$ mkdir ~/Desktop/wordpress && cd $_
```

Install and run WordPress.

```
$ curl https://raw.githubusercontent.com/miya0001/wp-instant-setup/master/wp-instant-setup.sh | bash
```

Or

```
$ curl https://raw.githubusercontent.com/miya0001/wp-instant-setup/master/wp-instant-setup.sh | bash -s <PORT> <DB_NAME>
```
