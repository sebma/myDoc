# Import a certificate into the Java keystore
To import a certificate into the Java system keystore, type this command :
```shell
JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | awk '/java.home/{printf$NF}')
sudo keytool -importcert -trustcacerts -alias Sectigo-Public-Server-Authentication-Root-E46 -file /etc/pki/ca-trust/source/anchors/Sectigo-Public-Server-Authentication-Root-E46.crt -keystore $JAVA_HOME/lib/security/cacerts -noprompt
```
To list certificates :
```shell
JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | awk '/java.home/{printf$NF}')
keytool -list -keystore $JAVA_HOME/lib/security/cacerts | grep trustedCertEntry
```
Change alias on one certificate on the Java system keystore :
```shell
JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | awk '/java.home/{printf$NF}')
sudo keytool -changealias -keystore $JAVA_HOME/lib/security/cacerts -alias "AC for example.com" -destalias "AC-for-example.com"
```
