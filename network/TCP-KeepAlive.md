# Pamametrage du KeepAlive :
* tcp_keepalive_time: The duration a connection needs to be idle before the TCP starts sending KeepAlive probes.
* tcp_keepalive_probes: The maximum number of KeepAlive probes TCP should send before dropping the connection.
* tcp_keepalive_intvl: The interval between individual KeepAlive probes.

## Exemple de pamametrage KeepAlive sur Windows :
```pwsh
New-ItemProperty HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters -n KeepAliveTime -v $(30*60*1000) -pr DWord

gpv HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters -n KeepAliveTime

```
cf. [Additional Registry Entries | Microsoft Learn - KeepAliveTime](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd349797(v=ws.10)?redirectedfrom=MSDN#keepalivetime)
## Exemple de pamametrage KeepAlive sur Linux :
```shell
sysctl net.ipv4.tcp_keepalive_time net.ipv4.tcp_keepalive_intvl net.ipv4.tcp_keepalive_probes
sudo sysctl -w net.ipv4.tcp_keepalive_time=$((30*60)) net.ipv4.tcp_keepalive_intvl=$((30*60))

```
cf. [Using TCP keepalive under Linux](https://tldp.org/HOWTO/TCP-Keepalive-HOWTO/usingkeepalive.html) ou [Configuring KeepAlive for better performance - Linux Bash](https://linuxbash.sh/post/configuring-keepalive-for-better-performance)
