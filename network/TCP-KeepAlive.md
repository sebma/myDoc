# Pamametrage du KeepAlive
## Exemple de pamametrage KeepAlive sur Windows :
```pwsh
New-ItemProperty HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters -n KeepAliveTime -v $(30*60*1000) -pr DWord

gpv HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters -n KeepAliveTime

```
## Exemple de pamametrage KeepAlive sur Linux :
```shell
sysctl net.ipv4.tcp_keepalive_time net.ipv4.tcp_keepalive_intvl net.ipv4.tcp_keepalive_probes
sudo sysctl -w net.ipv4.tcp_keepalive_time=$((30*60)) net.ipv4.tcp_keepalive_intvl=$((30*60))

```
