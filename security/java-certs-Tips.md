# Import a certificate into the Java keystore
To import a certificate into the Java keystore, type this command :
```shell
sudo keytool -importcert -trustcacerts -alias Sectigo-Public-Server-Authentication-CA-OV-E36 -file /etc/pki/ca-trust/source/anchors/Sectigo-Public-Server-Authentication-CA-OV-E36.crt -keystore /data/modules/transverse/trustStore.jks -noprompt
```
