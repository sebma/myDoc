# If you see these errors in the kernel journal :
```shell
$ journalctl -p err -o cat -b -0 | grep piix4_smbus
piix4_smbus 0000:00:07.3: SMBus Host Controller not enabled!
$
```
You can blacklist the "i2c_piix4" module if no I²C device is used :
```shell
$ ls /sys/bus/i2c/devices/ -1 | grep . -q || echo "blacklist i2c_piix4" | sudo tee /etc/modprobe.d/blacklist-i2c_piix4.conf
blacklist i2c_piix4
$
```
