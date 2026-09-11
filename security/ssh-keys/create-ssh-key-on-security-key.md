# Create a ssh-key on a security key
To create a ssh-key on a security key, type this command :
```shell
ssh-keygen -t ed25519-sk -C "your_email@example.com"
```
Read these for more info :
- [Generating a new SSH key for a hardware security key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key-for-a-hardware-security-key)
- [Securing SSH with FIDO2](https://developers.yubico.com/SSH/Securing_SSH_with_FIDO2.html)
