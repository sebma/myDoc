# Add AC certificates on Debian Linux Family

To AC certificates on Debian Linux Family, type this commands :
```shell
$ sudo apt install -V ca-certificates -y
$ sudo cp -piv *.crt /usr/local/share/ca-certificates/
$ sudo update-ca-certificates -v
$ trust list
```
<details>
<summary>Source information</summary>

- [update-ca-certificates(8) — ca-certificates — Debian trixie — Debian Manpages](https://manpages.debian.org/ca-certificates/update-ca-certificates.8.en.html)
- [SSLCertificatesOnDebian - HerzbubeWiki](https://wiki.herzbube.ch/wiki/SSLCertificatesOnDebian)
- [Install a root CA certificate in the trust store - Ubuntu Server documentation](https://ubuntu.com/server/docs/how-to/security/install-a-root-ca-certificate-in-the-trust-store/)
</details>
