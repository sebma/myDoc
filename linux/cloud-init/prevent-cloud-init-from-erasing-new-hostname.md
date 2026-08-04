# Prevent cloud init from erasing new hostname

```shell
	if ! egrep "preserve_hostname:\s+true" /etc/cloud/cloud.cfg.d/*.cfg -q;then
		$sudo tee /etc/cloud/cloud.cfg.d/99-preserve-hostname.cfg <<-EOF
			preserve_hostname: true
		EOF
	fi
```
