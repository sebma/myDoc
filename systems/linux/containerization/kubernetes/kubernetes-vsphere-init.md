# Kubernetes vSphere Initialization

<details>
<summary>Kubernetes vSphere tool requirements for Windows client</summary>

```pwsh
$TSC_ClusterIP=172.16.0.1
gsudo scoop bucket add kubetui https://github.com/sarub0b0/scoop-bucket
gsudo scoop install -g wget putty-cac podman podman-tui kubectl kubeadm kubectx kubens k9s helm kubetui
gsudo scoop install -g kubent
gsudo choco install -y vscode vscodium pulsar
gsudo wget.exe -c --no-check-certificate https://$TSC_ClusterIP/wcp/plugin/windows-amd64/vsphere-plugin.zip
Expand-Archive vsphere-plugin.zip
gsudo move .\bin\kubectl-vsphere.exe "$ENV:windir/system32"
rm bin\kubectl.exe vsphere-plugin.zip
rmdir bin

```
</details>
<details>
<summary>Kubernetes vSphere tool requirements for macOS client</summary>

```shell
$TSC_ClusterIP=172.16.0.1
brew install iproute2 curl wget
brew install helm k9s kubectl kubectl-tree kubectx kubetui podman podman-tui sofka
brew install kubent 
brew install --cask vscodium pulsar

wget -c --no-check-certificate -nv https://$TSC_ClusterIP/wcp/plugin/$(uname -s | tr [:upper:] [:lower:])-amd64/vsphere-plugin.zip
sudo unzip -d /usr/local/ vsphere-plugin.zip bin/kubectl-vsphere
rm -vf vsphere-plugin.zip

for tool in kube-proxy kubeadm kubectl kubectl-convert kubelet mounter;do
	wget -c "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/$(uname -s | tr [:upper:] [:lower:])/amd64/$tool"
	sudo install -pvm 755 $tool /usr/local/bin/
	rm -vf $tool
done
```
</details>
<details>
<summary>Kubernetes vSphere tool requirements for Linux client</summary>

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
### Kubernetes vSphere tools for Linux
```shell
TSC_ClusterIP=172.16.0.1
which wget >/dev/null || sudo apt install wget -Vy
which unzip >/dev/null || sudo apt install unzip -Vy
which dh_bash-completion >/dev/null || sudo apt install bash-completion -Vy

wget -c --no-check-certificate https://$TSC_ClusterIP/wcp/plugin/$(uname -s | tr [:upper:] [:lower:])-amd64/vsphere-plugin.zip
sudo unzip -d /usr/local/ vsphere-plugin.zip bin/kubectl bin/kubectl-vsphere

for tool in kube-proxy kubeadm kubectl kubectl-convert kubelet mounter;do
	wget -c "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/$(uname -s | tr [:upper:] [:lower:])/amd64/$tool"
	sudo install -pvm 755 $tool /usr/local/bin/
	rm -vf $tool
done

pkgList="kubectx"
for pkg in $pkgList; do which $pkg >/dev/null || sudo snap install "$pkg" --classic;done

which helm || curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4 | bash
if ! which k9s;then
	wget -c https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz
	tar xvzf k9s_Linux_amd64.tar.gz k9s
	sudo mv -v k9s /usr/local/bin/
fi

wget -c https://github.com/nklmilojevic/sofka/releases/download/v0.28.1/sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz
sudo tar -C /usr/local/bin/ -xvf sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz sofka
 
```
### Completion in Bash Profile
```shell
cat <<-EOF >> ~/.profile
#######################################################
cd
HISTSIZE=50000
HISTFILESIZE=100000
which kubectl >/dev/null && source <(kubectl completion $(basename $SHELL))
which kubectl-vsphere >/dev/null && source <(kubectl-vsphere completion $(basename $SHELL))
which helm >/dev/null && source <(helm completion $(basename $SHELL))
EOF
```
### kctl alias
```shell
cat <<-EOF >> ~/.bash_aliases
alias kctl=kubectl;complete -F __start_kubectl kctl
alias kctl-vsphere=kubectl-vsphere;complete -F __start_kubectl-vsphere kctl-vsphere
EOF
```
### ssh-agent configuration
[ssh-agent configuration](../../ssh-agent.md)
</details>

## Kubernetes vSphere Login

Then you can login to your Supervisor Cluster and then choose a context :
```shell
set -o nounset
kubectl-vsphere login --insecure-skip-tls-verify --server $TSC_ClusterIP --tanzu-kubernetes-cluster-name $myTKC
kubectl config view
kubectl config current-context
kubectl config get-contexts
kubectl config use-context $myContext
kubectl explain deploy
kubectl explain deploy.spec
kubectl create deployment test --image=nginx:latest --replicas=1 -o yaml --dry-run
kubectl create service clusterip test-svc --tcp=80:80 -o yaml --dry-run
kubectl get deploy
kubectl get service
kubectl api-resources
```

Once finished, you can :
```shell
kubectl-vsphere logout
```

The `kubectl-vsphere login` CLI options :
```shell
kubectl-vsphere login --help
```

See :
- [Getting started | Kubernetes](https://kubernetes.io/docs/setup)
- [Install the Kubernetes CLI Tools for vSphere](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere-supervisor/8-0/using-tkg-service-with-vsphere-supervisor/configuring-identity-and-access-for-tkg-service-clusters/installing-cli-tools-for-tkg-service-clusters/install-the-kubernetes-cli-tools-for-vsphere.html)
- [Connect to a TKG Service Cluster as a vCenter Single Sign-On User with Kubectl](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere-supervisor/8-0/using-tkg-service-with-vsphere-supervisor/configuring-identity-and-access-for-tkg-service-clusters/connecting-to-tkg-service-clusters-using-vcenter-sso-authentication/connect-to-a-tkg-service-cluster-as-a-vcenter-single-sign-on-user-with-kubectl.html)
- [VMware Lab Platform](https://labs.hol.vmware.com/HOL/catalog)

CNCF Applications Reference Framework : [CNCF Landscape](https://landscape.cncf.io/)
