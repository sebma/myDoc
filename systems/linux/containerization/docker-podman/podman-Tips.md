# List docker bridge network cidr :
```shell
podman network ls -n -f driver=bridge | awk '{print$2;exit}'
podman network inspect podman | jq -r .[].subnets[].subnet

```
Dans mon ~/.profile
```shell
#podman login --get-login $HARBOR_REPOS 2>/dev/null || podman login $HARBOR_REPOS -u $HARBOR_USER
jq .auths.\"$HARBOR_REPOS\".auth ${XDG_RUNTIME_DIR}/containers/auth.json &>/dev/null || podman login $HARBOR_REPOS -u $HARBOR_USER

```
