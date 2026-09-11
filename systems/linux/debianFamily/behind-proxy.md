# If your pc/server is behind a proxy

## To add a repo debian/ubuntu, you need to do this :

```shell
export http_proxy=$http_proxy https_proxy=$https_proxy
sudo -E add-apt-repository -y $repo
unset http_proxy https_proxy
```
