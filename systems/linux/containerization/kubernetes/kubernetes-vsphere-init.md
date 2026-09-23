# Kubernetes vSphere Initialization

## Kubernetes vSphere Initialization on Windows

```pwsh
$TSC_ClusterIP=172.16.0.1
gsudo scoop bucket add kubetui https://github.com/sarub0b0/scoop-bucket
gsudo scoop install -g wget putty-cac podman podman-tui kubectl kubectx kubens k9s helm kubetui
gsudo choco install -y vscode vscodium pulsar
gsudo wget.exe --no-check-certificate https://$TSC_ClusterIP/wcp/plugin/windows-amd64/vsphere-plugin.zip
gsudo Expand-Archive vsphere-plugin.zip "$ENV:windir/system32"
gsudo move .\bin\kubectl-vsphere.exe .
gsudo rm bin\kubectl.exe
gsudo rmdir bin

```
## Kubernetes vSphere Initialization on Ubuntu

```shell
TSC_ClusterIP=172.16.0.1
which wget >/dev/null || sudo apt install wget -Vy
which unzip >/dev/null || sudo apt install unzip -Vy
wget --no-check-certificate https://$TSC_ClusterIP/wcp/plugin/linux-amd64/vsphere-plugin.zip
sudo unzip -d /usr/local/ vsphere-plugin.zip bin/kubectl bin/kubectl-vsphere

pkgList="kubectl kubectx helm"
for pkg in $pkgList; do sudo snap install "$pkg" --classic;done

wget https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb
sudo apt install -V ./k9s_linux_amd64.deb
wget https://github.com/nklmilojevic/sofka/releases/download/v0.28.1/sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz
sudo tar -C /usr/local/bin/ -xvf sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz sofka
 
```
## Kubernetes vSphere Login

Then you can login to your Supervisor Cluster and then choose a context :
```shell
set -o nounset
kubectl vsphere login --server=$TSC_ClusterIP --insecure-skip-tls-verify
kubectl config current-context
kubectl config get-contexts
kubectl config use-context $myContext
```

See also :
```shell
kubectl vsphere login --help
```
and this [Connect to a TKG Service Cluster as a vCenter Single Sign-On User with Kubectl](https://techdocs.broadcom.com/us/en/vmware-cis/vsphere/vsphere-supervisor/8-0/using-tkg-service-with-vsphere-supervisor/configuring-identity-and-access-for-tkg-service-clusters/connecting-to-tkg-service-clusters-using-vcenter-sso-authentication/connect-to-a-tkg-service-cluster-as-a-vcenter-single-sign-on-user-with-kubectl.html).
