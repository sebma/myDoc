# Disable a 882 format APT repo without removing it

Disable ondrej Launchpad PPA repo for example :
```shell
sudo sed -i '/^Signed-By:/a Enabled: no' /etc/apt/sources.list.d/ondrej-ubuntu-php-$(lsb_release -sc).sources
```
