# List docker bridge network cidr :
```shell
podman network ls -n -f driver=bridge | awk '{print$2;exit}'
podman network inspect podman | jq -r .[].subnets[].subnet

```
# Parametrage
```shell
# ADD The podman login Token into the gnome key ring once and for all with this command :
#sudo apt install -V libsecret-tools # Pour utiliser la commande "secret-tool"
sudo apt install -V golang-docker-credential-helpers

# Facultatif
podmanAuthConfigFile=${XDG_CONFIG_HOME:-$HOME/.config}/containers/auth.json
test -f $podmanAuthConfigFile && ! test -s $podmanAuthConfigFile && echo '{}' > $podmanAuthConfigFile
for registry in docker.io quay.io ghcr.io $HARBOR_REPOS;do
    jq --arg reg "$registry" '.credHelpers |= (. // {}) | .credHelpers[$reg] = "secretservice"' $podmanAuthConfigFile | sponge $podmanAuthConfigFile
done
# POUR CHECK
jq . $HOME/.config/containers/auth.json
```
# Ajout des creds du registry : a faire une seule fois
```shell
#secret-tool store --label="Podman Registry Hub token" service podman registry $HARBOR_REPOS username $HARBOR_USER
read -s -p "Enter repo password:" myToken
jq -n --arg s "$HARBOR_REPOS" --arg u "$HARBOR_USER" --arg p "$myToken" '{ServerURL:$s,Username:$u,Secret:$p}' | docker-credential-secretservice store
```
# Dans mon `~/.profile`
```shell
#podman login --get-login $HARBOR_REPOS 2>/dev/null || podman login $HARBOR_REPOS -u $HARBOR_USER
mkdir -pv $HOME/.config/containers/

if ! jq -r .auths.\"$HARBOR_REPOS\".auth ${XDG_RUNTIME_DIR}/containers/auth.json &>/dev/null;then
    :
    # echo "=> podman login to $HARBOR_REPOS ..."
    # secret-tool lookup service podman registry $HARBOR_REPOS username $HARBOR_USER | podman login --username $HARBOR_USER $HARBOR_REPOS --password-stdin
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
