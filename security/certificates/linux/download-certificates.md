# Download website certificates with OpenSSL
To download website certificates with OpenSSL, type this command :
```shell
$ webSite=linuxfr.org
$ openssl s_client -connect $webSite:443 -showcerts </dev/null 2>/dev/null | awk -v webSite=$webSite '
/-----BEGIN CERTIFICATE-----/ { n++; out=webSite "-" n ".pem" }
out { print > out }
/-----END CERTIFICATE-----/ { close(out); out="" }
'
```
# Download website certificates with GnuTLS client
To download website certificates with GnuTLS client, type this command :
```shell
$ webSite=linuxfr.org
$ gnutls-cli --print-cert $webSite < /dev/null | awk -v webSite=$webSite '
/-----BEGIN CERTIFICATE-----/ { n++; out=webSite "-" n ".pem" }
out { print > out }
/-----END CERTIFICATE-----/ { close(out); out="" }
'
```
