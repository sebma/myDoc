# ssh-agent config for Linux on WSL
## Method 1
<details>
<summary>Bash Profile config</summary>

```shell
cat <<-EOF >> ~/.profile
#######################################################
if pgrep ssh-agent >/dev/null;then
	test -z "$SSH_AGENT_PID" && pkill ssh-agent
fi
if ! pgrep ssh-agent >/dev/null;then
	eval $(ssh-agent) >/dev/null
	tty -s && ssh-add -l
fi
EOF
```
</details>
<details>
<summary>Bash Logout config</summary>

```shell
cat <<-EOF >> ~/.bash_logout
#######################################################
tty -s && test -n "$SSH_AGENT_PID" && eval $(ssh-agent -k) || pkill ssh-agent
EOF
```
</details>

## Method 2
<details>
	<summary>Use the gpg-agent service socket</summary>

```shell
if gpgconf --list-dirs agent-ssh-socket | grep ssh -q;then
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket | grep ssh)
	grep SSH_AUTH_SOCK= ~/.bashrc -q || echo 'export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket | grep ssh)' >> ~/.bashrc
fi
```
</details>

## Method 3
<details>
<summary>Create a ssh-agent systemd service in userland</summary>

```shell
mkdir -p ~/.config/systemd/user
cat > ~/.config/systemd/user/ssh-agent.service <<'EOF'
[Unit]
Description=SSH Key Agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a ${SSH_AUTH_SOCK}

[Install]
WantedBy=default.target
EOF
systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
grep SSH_AUTH_SOCK= ~/.bashrc -q || echo 'export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"' >> ~/.bashrc
```
</details>

