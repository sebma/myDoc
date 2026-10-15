# Find Mac Address from Cisco core switch
```cisco
show mac address-table address CC:96:E1:23:45:67 # A adapter
show interfaces description | include Te5/0/15 # A adapter
```
# Find Mac Address from Cisco switch and display log messages
```cisco
show mac address-table address CC:96:E1:23:45:67 # A adapter
show logging | include GigabitEthernet5/0/12 # A adapter
```
