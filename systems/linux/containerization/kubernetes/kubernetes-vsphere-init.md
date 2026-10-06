# Kubernetes vSphere Initialization

## Kubernetes vSphere tool requirements for Windows client

```pwsh
$TSC_ClusterIP=172.16.0.1
gsudo scoop bucket add kubetui https://github.com/sarub0b0/scoop-bucket
gsudo scoop install -g wget putty-cac podman podman-tui kubectl kubectx kubens k9s helm kubetui
gsudo scoop install -g kubent
gsudo choco install -y vscode vscodium pulsar
gsudo wget.exe -c --no-check-certificate https://$TSC_ClusterIP/wcp/plugin/windows-amd64/vsphere-plugin.zip
gsudo Expand-Archive vsphere-plugin.zip "$ENV:windir/system32"
gsudo move .\bin\kubectl-vsphere.exe .
gsudo rm bin\kubectl.exe vsphere-plugin.zip
gsudo rmdir bin

```
## Kubernetes vSphere tool requirements for macOS client

```pwsh
$TSC_ClusterIP=172.16.0.1
brew install wget putty podman podman-tui kubectl kubectx k9s helm kubetui
brew install kubent
brew install --cask vscode vscodium pulsar
wget -c --no-check-certificate -nv https://$TSC_ClusterIP/wcp/plugin/darwin-amd64/vsphere-plugin.zip
unzip vsphere-plugin.zip bin/kubectl-vsphere
sudo mv -v bin/kubectl-vsphere /usr/local/bin/
rm -v vsphere-plugin.zip
rmdir -v bin/

```
## Kubernetes vSphere Initialization on Ubuntu

### IP Overlap attention

Be careful of the dockerd bridge network (172.17.0.0/16) which can overlap the IP of the Supervisor Cluster
Check with this command :
```shell
sudo docker network inspect bridge | jq -r '.[].IPAM.Config[].Subnet'
```
If so you have to stop `dockerd` service and shutdown the `docker0` interface, like this :
```shell
sudo systemctl stop docker.service docker.socket
sudo ip link set docker0 down
```
### Kubernetes vSphere tools for Ubuntu
```shell
TSC_ClusterIP=172.16.0.1
which wget >/dev/null || sudo apt install wget -Vy
which unzip >/dev/null || sudo apt install unzip -Vy
which dh_bash-completion >/dev/null || sudo apt install bash-completion -Vy

wget -c --no-check-certificate https://$TSC_ClusterIP/wcp/plugin/linux-amd64/vsphere-plugin.zip
sudo unzip -d /usr/local/ vsphere-plugin.zip bin/kubectl bin/kubectl-vsphere

pkgList="kubectl kubectx helm"
for pkg in $pkgList; do sudo snap install "$pkg" --classic;done

wget -c https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb
sudo apt install -V ./k9s_linux_amd64.deb
wget -c https://github.com/nklmilojevic/sofka/releases/download/v0.28.1/sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz
sudo tar -C /usr/local/bin/ -xvf sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz sofka
 
```
### Bash Profile
```shell
cat <<-EOF >> ~/.profile
#######################################################
cd
HISTSIZE=50000
HISTFILESIZE=100000
if ! pgrep ssh-agent >/dev/null;then
        eval $(ssh-agent) >/dev/null
        tty -s && ssh-add -l
fi
which kubectl >/dev/null && source <(kubectl completion $(basename $SHELL))
which kubectl-vsphere >/dev/null && source <(kubectl-vsphere completion $(basename $SHELL))
EOF
```
### Bash Logout
```shell
cat <<-EOF >> ~/.bash_logout
#######################################################
tty -s && test -n "$SSH_AGENT_PID" && eval $(ssh-agent -k)
EOF
```
### Bash Aliases
```shell
cat <<-EOF >> ~/.bash_aliases
alias kctl=kubectl;complete -F __start_kubectl kctl
alias kctl-vsphere=kubectl-vsphere;complete -F __start_kubectl-vsphere kctl-vsphere
EOF
```
## Kubernetes vSphere Login

Then you can login to your Supervisor Cluster and then choose a context :
```shell
set -o nounset
kubectl-vsphere login --insecure-skip-tls-verify --server=$TSC_ClusterIP
kubectl config current-context
kubectl config get-contexts
kubectl config use-context $myContext
```
One finished, you can :
```shell
kubectl-vsphere logout
```

The `kubectl-vsphere login` CLI options :
```shell
kubectl-vsphere login --help
```

See :
- [Connect to a TKG Service Cluster as a vCenter Single Sign-On User with Kubectl](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere-supervisor/8-0/using-tkg-service-with-vsphere-supervisor/configuring-identity-and-access-for-tkg-service-clusters/connecting-to-tkg-service-clusters-using-vcenter-sso-authentication/connect-to-a-tkg-service-cluster-as-a-vcenter-single-sign-on-user-with-kubectl.html)
- [The Kubernetes CLI Tools for vSphere download package (vsphere-plugin.zip ) cannot be downloaded from the Web UI](https://knowledge.broadcom.com/external/article/414343/the-kubernetes-cli-tools-for-vsphere-dow.html)

CNCF Applications Reference Framework : [CNCF Landscape](https://landscape.cncf.io/)
