# Niri WIP dotfiles

WIP Niri configuration files, still missing idle configuration, lock, polkit, greeter/DM

Core Packages
```bash
niri xdg-desktop-portal-gtk xdg-user-dirs ufw fwupd nano
```

Essential/Preferred Apps
```bash
wlsunset alacritty swaync fuzzel swaybg ttf-dejavu-nerd
```

Codecs/Drivers/Other Stuff
```bash
imagemagick ffmpeg opus opusfile mesa vulkan-radeon
```

Other Daily Usage Apps
```bash
swayimg btop thunar thunar-volman tumbler
```

Steam flatpak permissions (.local/share/flatpak/overrides/com.valvesoftware.Steam)
```bash
[Context]
shared=!ipc;!network
devices=!all;input;dri
features=!bluetooth;!devel
filesystems=!xdg-music;!xdg-pictures;!xdg-run/app/com.discordapp.Discord

[Session Bus Policy]
org.gnome.SettingsDaemon.MediaKeys=none
```

Zen flatpak permissions (.local/share/flatpak/overrides/app.zen_browser.zen)
```bash
[Context]
shared=!ipc;!network
sockets=!cups;!pcsc;!fallback-x11;!x11
features=!devel
filesystems=!/run/.heim_org.h5l.kcm-socket

[Environment]
DICPATH=
```
