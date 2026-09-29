# Telnet equivalent on macOS
## Option 1 : use tcp_open function via autoload
```zsh
autoload -U tcp_open
tcp_open $remoteIP $port
```
## Option 2 : use ztcp from zmodload
```zsh
zmodload zsh/net/tcp
ztcp -v $remoteIP $port
```
### Option 3 : use the netcat/nc command
```zsh
nc -vz $remoteIP $port
```
