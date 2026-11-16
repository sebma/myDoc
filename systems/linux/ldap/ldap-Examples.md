# ldapsearch command examples 
```shell
ldapsearch -W -LLL -x -H ldap://myDOMAIN.lan -D userName@myDOMAIN.LAN -b "cn=firstname.lastname" dn description cn sAMAccountName userPrincipalName vmwPasswordNeverExpires
# OU
ldapsearch -W -LLL -x -H ldap://myDOMAIN.lan -D "CN=userName,CN=Users,DC=vsphere,DC=local" -b "cn=firstname.lastname,CN=Users,DC=vsphere,DC=local" dn description cn sAMAccountName userPrincipalName vmwPasswordNeverExpires
```
# ldap.conf example 
```conf
BASE    dc=vsphere,dc=local
URI     ldap://localhost
```
