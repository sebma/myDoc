# Winget through proxy as admin (I HAVE NOT TESTED YET) :

```pwsh
winget settings --enable ProxyCommandLineOptions
winget install --id Microsoft.PowerShell --scope machine --accept-package-agreements --proxy https://127.0.0.1:2345
# OR
winget settings set DefaultProxy https://127.0.0.1:2345
winget --info | sls Proxy
```

See [winget-cli/doc/specs/#190 - Proxy Support.md at master · microsoft/winget-cli](https://github.com/microsoft/winget-cli/blob/master/doc/specs/%23190%20-%20Proxy%20Support.md) and [winget-cli/doc/Settings.md at master · microsoft/winget-cli](https://github.com/microsoft/winget-cli/blob/master/doc/Settings.md).
