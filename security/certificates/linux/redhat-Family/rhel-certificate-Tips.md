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

- [Chapter 3. Using shared system certificates | Securing networks | Red Hat Enterprise Linux | 8 | Red Hat Documentation](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/securing_networks/using-shared-system-certificates_securing-networks)
- [How to configure your CA trust list in Linux](https://www.redhat.com/en/blog/configure-ca-trust-list)
</details>
