# ldapsearch command examples 
```shell
ldapsearch -W -LLL -x -H ldap://myDOMAIN.lan -D userName@myDOMAIN.LAN -b "CN=Users,DC=myDOMAIN,DC=LAN" "cn=firstname.lastname" dn description cn sAMAccountName userPrincipalName vmwPasswordNeverExpires
# OU
ldapsearch -W -LLL -x -H ldap://localhost -D "CN=userName,CN=Users,DC=vsphere,DC=local" -b "CN=Users,DC=vsphere,DC=local" "cn=firstname.lastname" dn description cn sAMAccountName userPrincipalName vmwPasswordNeverExpires
```
# ldap.conf example 
```conf
BASE    dc=vsphere,dc=local
URI     ldap://localhost
```
