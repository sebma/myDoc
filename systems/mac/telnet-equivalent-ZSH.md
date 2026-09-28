# Telnet equivalent in ZSH
## Option 1 : use tcp_open function via autoload
```zsh
autoload -U tcp_open
tcp_open $remoteIP
```
## Option 2 : use ztcp from zmodload
```zsh
zmodload zsh/net/tcp
ztcp -v $remoteIP
```
### Option 3 : use the netcat/nc command
```zsh
nc -vz $remoteIP
```
