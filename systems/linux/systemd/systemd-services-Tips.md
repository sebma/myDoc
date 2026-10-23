# Disable "not-found" services matching $pattern
```shell
systemctl --plain --state=not-found -at service | awk "/$pattern/"'{print $1}' | while read serviceName;do sudo systemctl disable $serviceName;done
```
# Disable "inactive" services matching $pattern
```shell
systemctl --plain --state=inactive -at service | awk "/$pattern/"'{print $1}' | while read serviceName;do sudo systemctl disable $serviceName;done
```
