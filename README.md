# WordPress Installer on your desktop.

WordPress development environment with PHP built-in web server + WP-CLI.

## Requires

* php 5.4 or later
* MySQL

## Uage

```
$ curl https://.../run.sh | bash -s <db-user> <db-pass> <db-name>
```

or

```
$ ./run.sh <db-user> <db-pass> <db-name>
```

### Defaults

* db-user: `root`
* db-pass: (empty)
* db-name: `wpdev`

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
$ curl https://raw.githubusercontent.com/miya0001/wp-instant-setup/master/run.sh | bash -s root root
```

Or

```
$ git clone git@github.com:miya0001/wp-instant-setup.git && cd wp-instant-setup
$ ./run.sh root root
```

## Advanced Tips

Add alias into your `~/.bash_profile` like following.

```
alias wpserve="curl https://raw.githubusercontent.com/miya0001/wp-instant-setup/master/run.sh | bash -s <db-user> <db-pass>"
```

Then just run:

```
$ wpserve <db-name>
```
