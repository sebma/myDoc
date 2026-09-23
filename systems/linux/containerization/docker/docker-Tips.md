# List docker containers by CPU usage :
```shell
sudo docker stats --no-stream | { read -r header; printf '%s\n' "$header"; sort -k3 -nr; }
```
# List docker containers by MEM usage :
```shell
sudo docker stats --no-stream | { read -r header; printf '%s\n' "$header"; sort -k4 -nr; }
```
