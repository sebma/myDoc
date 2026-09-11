# Import a certificate into the Java keystore
To import a certificate into the Java keystore, type this command :
```shell
sudo env javaVersion=1.8.0_221 keytool -importcert -trustcacerts -alias Sectigo-Public-Server-Authentication-Root-E46 -file /etc/pki/ca-trust/source/anchors/Sectigo-Public-Server-Authentication-Root-E46.crt -keystore /usr/java/jdk$javaVersion-amd64/jre/lib/security/cacerts -noprompt
```
To list certificates :
```shell
env javaVersion=1.8.0_221 keytool -list -keystore /usr/java/jdk1.8.0_221-amd64/jre/lib/security/cacerts | grep trustedCertEntry
```
