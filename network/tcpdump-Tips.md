# Find DNS Lookups being done
On Linux :
```shell
sudo tcpdump -nl dst port 53 | awk '/\sA/{print$(NF-1)}'

```
On Windows :
```shell
sudo tshark -n -l -f "dst port 53" | ? { $_ -match "\sA" } | % { ($_ -split '\s+')[-2] }
```
