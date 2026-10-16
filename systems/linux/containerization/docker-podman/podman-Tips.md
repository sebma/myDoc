# List docker bridge network cidr :
```shell
podman network ls -n -f driver=bridge | awk '{print$2;exit}'
podman network inspect podman | jq -r .[].subnets[].subnet

```
# Dans mon ~/.profile
```shell
#podman login --get-login $HARBOR_REPOS 2>/dev/null || podman login $HARBOR_REPOS -u $HARBOR_USER
jq .auths.\"$HARBOR_REPOS\".auth ${XDG_RUNTIME_DIR}/containers/auth.json &>/dev/null || { echo "=> podman login to $HARBOR_REPOS ...";podman login $HARBOR_REPOS -u $HARBOR_USER; }
mkdir -pv $HOME/.config/containers/ $HOME/.kube/

```
# Definir la liste des repo dans $HOME/.config/containers/registries.conf :
```shell
grep "docker.io" $HOME/.config/containers/registries.conf -q || echo 'unqualified-search-registries = ["docker.io"]' >> $HOME/.config/containers/registries.conf
```
# Lister les registries utilises :
```shell
podman info | yq .registries.search[]
```
