# Add AC certificates on RedHat Linux Family

To AC certificates on RedHat Linux Family, type this commands :
```shell
$ sudo yum install -v ca-certificates -y || sudo dnf install -v ca-certificates -y
$ sudo cp -piv *.crt /etc/pki/ca-trust/source/anchors/
$ sudo update-ca-trust extract
$ trust list
```
<details>
<summary>Source information</summary>

- [How to configure your CA trust list in Linux](https://www.redhat.com/en/blog/configure-ca-trust-list)
</details>
