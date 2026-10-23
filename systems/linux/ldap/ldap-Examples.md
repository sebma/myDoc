# ldapsearch command examples 
```shell
ldapsearch -LLL -x -H ldap://myDOMAIN.lan -D userName@myDOMAIN.LAN -W -b "(cn=firstname.lastname)"  servicePrincipalName vmwPasswordNeverExpires
# OU
ldapsearch -LLL -x -H ldap://myDOMAIN.lan -D "CN=userName,CN=Users,DC=myDOMAIN,DC=LAN" -W -b "(cn=firstname.lastname)" userPrincipalName sAMAccountName
```
