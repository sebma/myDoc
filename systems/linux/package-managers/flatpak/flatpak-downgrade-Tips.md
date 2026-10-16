Downgrade du flatpak de Flameshot en v13.3 à cause du [bug Screenshot portal timed out after 30 seconds · Issue #4639 · flameshot-org/flameshot](https://github.com/flameshot-org/flameshot/issues/4639) en attendant [la v15.0 qui inclus le correctif](https://github.com/flameshot-org/flameshot/pull/4826) :
```shell
flatpak remote-info flathub org.flameshot.Flameshot --log
flatpak remote-info flathub org.flameshot.Flameshot --log | grep -1 v13.3
sudo flatpak update --commit=f654e4bded4c3e172633e4c44524c729423d63a1f2ccf2e91a27f2622cb06195 org.flameshot.Flameshot
sudo flatpak mask org.flameshot.Flameshot

```
