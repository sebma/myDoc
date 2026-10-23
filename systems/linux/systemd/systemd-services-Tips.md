# Disable `not-found` systemd services matching `$pattern`
```shell
sudo systemctl disable $(systemctl --quiet --plain --state=not-found -at service | awk "/$pattern/"'{printf$1" "}')
```
# Disable `inactive` systemd services matching `$pattern`
```shell
sudo systemctl disable $(systemctl --quiet --plain --state=inactive  -at service | awk "/$pattern/"'{printf$1" "}')
```
