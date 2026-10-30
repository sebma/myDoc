# Kubernetes vSphere Initialization

<details>
<summary>IP Overlap attention if docker is also installed on macOS/Linux/WSL</summary>

Check by which interface you are going through when trying to join the Supervisor :
```shell
TSC_ClusterIP=172.17.1.1 # A ADAPTER
ip -c=never route get $TSC_ClusterIP | grep -oP 'dev\s\K\w+\d+'
```
Be careful of the dockerd `bridge` network range `(172.17.0.0/16)` which can overlap with the IP of the Supervisor Cluster
Check with this command :
```shell
sudo docker network inspect bridge | jq -r '.[].IPAM.Config[].Subnet'
```
If so you have to stop `dockerd` service and shutdown the `docker0` interface, like this :
```shell
sudo systemctl stop docker.service docker.socket
sudo ip link set docker0 down
```
Another solution : install `podman` which uses the `10.88.0.0/16` CIDR :) :
```shell
podman network inspect podman 2>/dev/null | jq -r '.[].subnets[].subnet'
```

</details>


<details>
<summary>Ma config git</summary>

```shell
git config --global core.editor vim
git config --global credential.helper "cache --timeout=86400"
git config --global alias.local-undelete '!git ls-files -d | grep . && git ls-files -d | xargs git checkout-index'
# Puis tout mes autres alias git :-)
git config user.name SebM
git config user.email $myEmail
git config -l | grep user # Pour vérifier
git config -e # Pour editer a la mano
```

</details>

<details>
<summary>Kubernetes vSphere tool requirements for macOS clients</summary>

```shell
$TSC_ClusterIP=172.16.0.1 # A ADAPTER
which brew >/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install iproute2 curl wget jq yq moreutils gnutls netcat
brew install helm k9s kubectl kubectl-tree kubectx kubetui podman podman-compose podman-tui sofka
brew install kubent kompose
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
<summary>Kubernetes vSphere tool requirements for Linux/WSL clients</summary>

### Kubernetes vSphere tools for Linux/WSL
```shell
TSC_ClusterIP=172.16.0.1 # A ADAPTER
for package in wget unzip dlocate plocate podman podman-compose;do
	which $package >/dev/null || sudo apt install $package -Vy
dne

which dh_bash-completion >/dev/null || sudo apt install bash-completion -Vy
which gnutls-cli >/dev/null || sudo apt install gnutls-bin -Vy
which sponge >/dev/null || sudo apt install moreutils -Vy
which nc.openbsd >/dev/null || sudo apt install netcat-openbsd -Vy

wget -c --no-check-certificate https://$TSC_ClusterIP/wcp/plugin/$(uname -s | tr [:upper:] [:lower:])-amd64/vsphere-plugin.zip
sudo unzip -d /usr/local/ vsphere-plugin.zip bin/kubectl bin/kubectl-vsphere

for tool in kube-proxy kubeadm kubectl kubectl-convert kubelet mounter;do
	wget -c "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/$(uname -s | tr [:upper:] [:lower:])/amd64/$tool"
	sudo install -pvm 755 $tool /usr/local/bin/
	rm -vf $tool
done

pkgList="jq yq kubectx"
for pkg in $pkgList; do which $pkg >/dev/null || sudo snap install "$pkg" --classic;done

which helm || curl -s https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4 | bash
if ! which k9s;then
	wget -c https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz
	tar xvzf k9s_Linux_amd64.tar.gz k9s
	sudo mv -v k9s /usr/local/bin/
fi

wget -c https://github.com/nklmilojevic/sofka/releases/download/v0.28.1/sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz
sudo tar -C /usr/local/bin/ -xvf sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz sofka

curl -sLS https://github.com/kubernetes/kompose/releases/latest/download/kompose-linux-amd64 -o kompose
sudo install -vpm 755 kompose /usr/local/bin/
rm -f kompose

```
</details>

<details>
<summary>Configure kubectl/helm in BASH</summary>

### Configure kubectl/helm completion in Bash Profile
```shell
cat >> ~/.profile <<-EOF
#######################################################
cd
HISTSIZE=50000
HISTFILESIZE=100000
for tool in kubectl kubectl-vsphere helm kind;do
	command -v $tool >/dev/null && source <($tool completion ${SHELL/*\/})
done
mkdir -pv $HOME/.config/containers/
EOF
```
### Configure kctl bash aliases
```shell
cat >> ~/.bash_aliases <<-EOF
alias kctl=kubectl;complete -F __start_kubectl kctl
alias kctl-vsphere=kubectl-vsphere;complete -F __start_kubectl-vsphere kctl-vsphere
EOF
```
</details>


<details>
<summary>Configure kubectl/helm in ZSH</summary>

```shell
mkdir -pv ~/.zsh/completions
kubectl completion zsh > ~/.zsh/completions/_kubectl
kubectl-vsphere completion zsh >> ~/.zsh/completions/_kubectl-vsphere
helm completion zsh > ~/.zsh/completions/_helm
cat >> ~/.zshrc <<-EOF
#######################################################
#fpath=(~/.zsh/completions $fpath)
for tool in kubectl kubectl-vsphere helm kind;do
        command -v $tool >/dev/null && source <($tool completion ${SHELL/*\/})
done
autoload -Uz compinit
compinit
EOF
```
</details>

### ssh-agent configuration for Linux/WSL
[ssh-agent configuration](../../ssh-agent.md)

<details>
<summary>Environnement de travail</summary>

Install ( [vscodium](https://github.com/VSCodium/vscodium) || [Pulsar](https://github.com/pulsar-edit/pulsar) ) + ( [GitHub Desktop](https://desktop.github.com/download/) || [Gitnuro](https://github.com/JetpackDuba/Gitnuro) || [gitahead](https://github.com/gitahead/gitahead) )

</details>

<details>
<summary>Kubernetes vSphere tool requirements for Windows clients</summary>

```pwsh
$TSC_ClusterIP=172.16.0.1 # A ADAPTER
gsudo scoop bucket add kubetui https://github.com/sarub0b0/scoop-bucket
gsudo scoop install -g curl wget jq yq putty-cac gnutls netcat
gsudo scoop install -g podman podman-tui kubectl kubeadm kubectx kubens k9s helm kubetui
gsudo scoop install -g kubent kompose
gsudo choco install -y vscode vscodium pulsar
gsudo wget.exe -c --no-check-certificate https://$TSC_ClusterIP/wcp/plugin/windows-amd64/vsphere-plugin.zip
Expand-Archive vsphere-plugin.zip
gsudo move .\bin\kubectl-vsphere.exe "$ENV:windir/system32"
rm bin\kubectl.exe vsphere-plugin.zip
rmdir bin

```
</details>

<details>
<summary>Configure kubectl/helm in powershell</summary>

```powershell
mkdir -force ~/.kube/completions/
kubectl completion powershell > ~/.kube/completions/_kubectl-completion.ps1
kubectl-vsphere completion powershell >> ~/.kube/completions/_kubectl-vsphere-completion.ps1
helm completion powershell > ~/.kube/completions/_helm-completion.ps1
#  Add-Content $PROFILE ". '$HOME\.kube\completion.ps1'"
```
</details>

<details>
<summary>Kubernetes vSphere Login</summary>

Then you can login to your Supervisor Cluster and then choose a context :
```shell
set -o nounset
kubectl-vsphere login --insecure-skip-tls-verify --server $TSC_ClusterIP --tanzu-kubernetes-cluster-name $myTKC
kubectl version --client
kubectl config view
kubectl config current-context
kubectl config get-contexts
kubectl config use-context $myContext
kubectl cluster-info
kubectl get nodes
kubectl get ns
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
</details>

<details>
<summary>Appendices</summary>

See :
- [Getting started | Kubernetes](https://kubernetes.io/docs/setup)
- [Download Kubernetes | Kubernetes](https://kubernetes.io/releases/download/#binaries)
- [Install the Kubernetes CLI Tools for vSphere](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere-supervisor/8-0/using-tkg-service-with-vsphere-supervisor/configuring-identity-and-access-for-tkg-service-clusters/installing-cli-tools-for-tkg-service-clusters/install-the-kubernetes-cli-tools-for-vsphere.html)
- [kubectl completion | Kubernetes](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_completion/)
- [Connect to a TKG Service Cluster as a vCenter Single Sign-On User with Kubectl](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere-supervisor/8-0/using-tkg-service-with-vsphere-supervisor/configuring-identity-and-access-for-tkg-service-clusters/connecting-to-tkg-service-clusters-using-vcenter-sso-authentication/connect-to-a-tkg-service-cluster-as-a-vcenter-single-sign-on-user-with-kubectl.html)
- [VMware Lab Platform](https://labs.hol.vmware.com/HOL/catalog)
- [Kompose - Convert your Docker Compose file to Kubernetes or OpenShift](https://kompose.io/)

CNCF Applications Reference Framework : [CNCF Landscape](https://landscape.cncf.io/)

</details>
