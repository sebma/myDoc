Si y a des errors "failed to get .* uid" dans le journal de `multipathd.service` :
 
```shell
journalctl -b -0 -u multipathd | grep failed | head
```
On peut vérifier aussi si la commande "multipath" renvoi ces erreurs :
 
```shell
sudo multipath
```
Pour tester si les UUID des disques sont visibles :
 
```shell
ls -l /dev/disk/by-uuid/ | grep sd[a-z]*1
```
Une solution disk.EnableUUID=TRUE dans le vmx OU blacklister le "VMware Virtual disk" dans la conf multipath :  https://bugs.launchpad.net/ubuntu/+source/multipath-tools/+bug/1875594/comments/17 :
```shell
sudo tee /etc/multipath/blacklist-VMware-Virtual-disk-in-multipathd.conf <<EOF
blacklist {
	device {
		vendor "VMware"
		product "Virtual disk"
	}
}
EOF
```

Voir aussi https://askubuntu.com/a/1340977/426176
 
cf. https://bugs.launchpad.net/ubuntu/+source/multipath-tools/+bug/1875594
 
Voir aussi : server - Ubuntu 20.04 multipath configuration - Ask Ubuntu - disk.EnableUUID = "TRUE"
