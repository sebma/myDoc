msDS-SupportedEncryptionTypes :

See [Decrypting the Selection of Supported Kerberos Encryption Types](https://techcommunity.microsoft.com/blog/coreinfrastructureandsecurityblog/decrypting-the-selection-of-supported-kerberos-encryption-types/1628797)

To ckeck :
```pwsh
Get-ADComputer -Identity DC-SCALITY-17 -Property msDS-SupportedEncryptionTypes | Select Name , msDS-SupportedEncryptionTypes
```
To set msDS-SupportedEncryptionTypes on computer account directly from linux PC :
```shell
sudo msktutil update --dont-change-password --enctypes 0x18
```
