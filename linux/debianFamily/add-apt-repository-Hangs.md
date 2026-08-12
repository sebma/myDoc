# If `add-apt-repository -r` hangs on Ubuntu :
Do this :
```shell
pgrep dpkg >/dev/null || sudo rm -vf /var/lib/dpkg/lock
pgrep apt  >/dev/null || sudo rm -vf /var/lib/apt/lists/lock
```
And then re-run `add-apt-repository -r`.
