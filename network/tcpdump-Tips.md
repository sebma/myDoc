# Find DNS Lookups being done
```shell
sudo tcpdump -nl dst port 53 | awk '\sA/{print$(NF-1)}'
```
