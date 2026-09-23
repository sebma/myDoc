# Kubernetes vSphere Initialization

## Kubernetes vSphere Initialization on Windows

```pwsh
$TKG_ClusterIP=172.16.0.1
sudo scoop bucket add kubetui https://github.com/sarub0b0/scoop-bucket
sudo scoop install -g wget putty-cac podman podman-tui kubectl kubectx kubens k9s helm kubetui
sudo choco install -y vscode vscodium pulsar
wget.exe --no-check-certificate https:/$TKG_ClusterIP/wcp/plugin/windows-amd64/vsphere-plugin.zip
Expand-Archive vsphere-plugin.zip "$env:windir/system32"
move .\bin\kubectl-vsphere.exe .
rm bin\kubectl.exe
rmdir bin

```
## Kubernetes vSphere Initialization on Ubuntu

```shell
TKG_ClusterIP=172.16.0.1
wget --no-check-certificate https://$TKG_ClusterIP/wcp/plugin/linux-amd64/vsphere-plugin.zip
sudo unzip -d /usr/local/ vsphere-plugin.zip bin/kubectl bin/kubectl-vsphere

sudo snap install kubectl kubectx helm
wget https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.deb
sudo apt install -V ./k9s_linux_amd64.deb
wget https://github.com/nklmilojevic/sofka/releases/download/v0.28.1/sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz
sudo tar -C /usr/local/bin/ -xvf sofka-v0.28.1-x86_64-unknown-linux-gnu.tar.gz sofka
 
```
