# Add AC certificates on Debian Linux Family

To AC certificates on Debian Linux Family, type this commands :
```shell
$ sudo apt install -V ca-certificates -y
$ sudo cp -piv *.crt /usr/local/share/ca-certificates/
$ sudo update-ca-certificates -v
```
