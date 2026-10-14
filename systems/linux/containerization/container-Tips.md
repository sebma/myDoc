# Find IPv4 from inside container
```shell
hostname -I
# OR
getent ahostsv4 $HOSTNAME
# OR
grep -B1 "/32 host" /proc/net/fib_trie | egrep -v 'LOCAL|127.0.0.1|^--' | sort -u
```
# Find IPv4 routing table from inside container
```shell
cat /proc/net/route
# OR
awk 'function h2ip(h) { return strtonum("0x" substr(h,7,2)) "." strtonum("0x" substr(h,5,2)) "." strtonum("0x" substr(h,3,2)) "." strtonum("0x" substr(h,1,2)) } NR > 1 { printf "%-5s %-15s %-15s %-15s\n", $1, h2ip($2), h2ip($3), h2ip($8) }' /proc/net/route
```
