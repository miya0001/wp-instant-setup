# WordPress Installer on your desktop.

WordPress development environment with PHP built-in web server + WP-CLI.

## Requires

* php 5.4 or later
* MySQL
* [Mailcatcher](http://mailcatcher.me/)

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
$ ./run.sh wpdev root root
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
