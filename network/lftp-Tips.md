# Do not verify specific FTPS certificate with lftp
```shell
lftp ftps://$remoteIP <<< ls
ls: Fatal error: Certificate verification: The certificate is NOT trusted. The certificate issuer is unknown.  (FI:NG:ER:PR:IN:T:HE:RE)
fingerPrint=$(lftp ftps://$remoteIP <<< ls 2>&1 | awk -F '[()]' '/unknown./{print$(NF-1)}')
egrep "^\s*set ssl:verify-certificate/$fingerPrint no" ~/.lftprc -q || echo set ssl:verify-certificate/$fingerPrint no >> ~/.lftprc
```
