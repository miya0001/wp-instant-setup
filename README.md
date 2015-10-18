# WordPress Installer on your desktop.

WordPress development environment with PHP built-in web server + WP-CLI.

## Requires

* php 5.4 or later
* MySQL

## How to use

```
$ mkdir ~/Desktop/wordpress && cd $_
$ curl https://raw.githubusercontent.com/miya0001/wp-instant-setup/master/run.sh | bash
```

Or

```
$ git clone git@github.com:miya0001/wp-instant-setup.git && cd wp-instant-setup
$ ./run.sh
```

### For MAMP users

```
$ mkdir ~/Desktop/wordpress && cd $_
$ curl https://raw.githubusercontent.com/miya0001/wp-instant-setup/master/run.sh | bash -s wpdev root root
```

Or

```
$ git clone git@github.com:miya0001/wp-instant-setup.git && cd wp-instant-setup
$ ./run.sh wpdv root root
```
