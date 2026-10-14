# Find IP from inside container :
```shell
getent ahosts $HOSTNAME
# OR
grep -B1 "/32 host" /proc/net/fib_trie | egrep -v 'LOCAL|127.0.0.1|^--' | sort -u
```
