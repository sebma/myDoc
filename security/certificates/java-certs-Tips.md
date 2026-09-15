# Import a certificate into the Java keystore
To import a certificate (for example : "Sectigo Public Server Authentication CA OV E36") into the Java system keystore, type this command :
```shell
JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | awk '/java.home/{printf$NF}')
keyStore=$JAVA_HOME/lib/security/cacerts 
sudo keytool -importcert -trustcacerts -alias Sectigo-Public-Server-Authentication-Root-E46 -file /etc/pki/ca-trust/source/anchors/Sectigo-Public-Server-Authentication-Root-E46.crt -keystore $keyStore -noprompt
```
To list certificates aliases :
```shell
JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | awk '/java.home/{printf$NF}')
keyStore=$JAVA_HOME/lib/security/cacerts 
keytool -list -keystore $keyStore | grep trustedCertEntry
```
Change alias on one certificate on the Java system keystore :
```shell
JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | awk '/java.home/{printf$NF}')
keyStore=$JAVA_HOME/lib/security/cacerts 
sudo keytool -changealias -keystore $keyStore -alias "AC for example.com" -destalias "AC-for-example.com"
```
