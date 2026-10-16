Downgrade du flatpak de Flameshot en v13.3 à cause du bug Screenshot portal timed out after 30 seconds · Issue #4639 · flameshot-org/flameshot en attendant la v15.0 qui inclus le correctif :
```shell
flatpak remote-info --log flathub org.flameshot.Flameshot
flatpak remote-info --log flathub org.flameshot.Flameshot | grep -1 v13.3
#sudo flatpak update --commit=f654e4bded4c3e172633e4c44524c729423d63a1f2ccf2e91a27f2622cb06195 org.flameshot.Flameshot
sudo flatpak update --commit=7a6bb71759ac org.flameshot.Flameshot
sudo flatpak mask org.flameshot.Flameshot 
```
