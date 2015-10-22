# WordPress Installer on your desktop.

WordPress development environment with PHP built-in web server + WP-CLI.

## Requires

* OSX
* php 5.4 or later
* MySQL
* [Composer](https://getcomposer.org/)
* [Mailcatcher](http://mailcatcher.me/)

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

## Default Account

* User: `admin`
* Password: `admin`

## Advanced Tips

Add alias into your `~/.bash_profile` like following.

```
alias wpserve="curl https://raw.githubusercontent.com/miya0001/wp-instant-setup/master/run.sh | bash -s <db-user> <db-pass>"
```

Then just run:

```
$ wpserve <db-name>
```

## Note

### How to install Mailcatcher and Wordmove into your Mac.

Install ruby 2.2.3.

```
$ brew install rbenv openssl
$ rbenv install 2.2.3
$ rbenv global 2.2.3
```

Add following into `~/.bash_profile`.

```
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
```

Then:

```
$ source ~/.bash_profile
```

Install Wordmove and Mailcatcher.

```
$ gem install wordmove
$ gem install mailcatcher -- --with-cppflags=-I$(brew --prefix openssl)/include
```

Run MailCatcher as a daemon.

```
$ mailcatcher
```

Then visit `http://127.0.0.1:1080/`
