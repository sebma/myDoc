# Disable a RFC822 format APT repo without removing it

Disable [`ondrej Launchpad PPA repo`](https://launchpad.net/~ondrej/+archive/ubuntu/php) for example :
```shell
grep 'Enabled: no' /etc/apt/sources.list.d/ondrej-ubuntu-php-$(lsb_release -sc).sources -q || sudo sed -i '/^Signed-By:/i Enabled: no' /etc/apt/sources.list.d/ondrej-ubuntu-php-$(lsb_release -sc).sources
```
