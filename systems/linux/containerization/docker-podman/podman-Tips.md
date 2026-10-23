# List docker bridge network cidr :
```shell
podman network ls -n -f driver=bridge | awk '{print$2;exit}'
podman network inspect podman | jq -r .[].subnets[].subnet

```
# Dans mon `~/.profile`
```shell
#podman login --get-login $HARBOR_REPOS 2>/dev/null || podman login $HARBOR_REPOS -u $HARBOR_USER
mkdir -pv $HOME/.config/containers/
# ADD The podman login Token into the gnome key ring once and for all with this command :
# secret-tool store --label="Podman Registry Hub token" service podman registry $HARBOR_REPOS username $HARBOR_USER
if ! jq -r .auths.\"$HARBOR_REPOS\".auth ${XDG_RUNTIME_DIR}/containers/auth.json &>/dev/null;then
    echo "=> podman login to $HARBOR_REPOS ..."
    secret-tool lookup service podman registry $HARBOR_REPOS username $HARBOR_USER | podman login --username $HARBOR_USER $HARBOR_REPOS --password-stdin
    # VOIR AUSSI LE "docker-credential-secretservice"
fi

```
# Definir la liste des repo dans $HOME/.config/containers/registries.conf :
```shell
grep "docker.io" $HOME/.config/containers/registries.conf -q 2>/dev/null || echo 'unqualified-search-registries = ["docker.io"]' >> $HOME/.config/containers/registries.conf
```
# Lister les registries utilises :
```shell
podman info | yq .registries.search[]
```
# Stockage des images podman :
```shell
podmanStorage=$(podman info | yq .store.graphRoot)
du -sh $podmanStorage
```
