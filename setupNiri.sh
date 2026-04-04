#!/bin/bash

if [[ `whoami` != 'root' ]]
  then echo "Please run as root, sudo bash setupNiri.sh"
  exit
fi

# Update system
sudo pacman -Syu --noconfirm
sleep 0.5

# Install core packages
sudo pacman -S niri xdg-desktop-portal-gtk xdg-user-dirs ufw fwupd nano --noconfirm
sleep 0.5

# Install essential packages
sudo pacman -S wlsunset alacritty mako fuzzel swaybg ttf-dejavu-nerd --noconfirm
sleep 0.5

# Install some other stuff
sudo pacman -S imagemagick ffmpeg opus opusfile mesa vulkan-radeon --noconfirm
sleep 0.5

# Install apps
sudo pacman -S swayimg btop thunar thunar-volman tumbler --noconfirm
sleep 0.5

clear
echo "ATIVAR ufw E greetd, substitua o comando default no arquivo /etc/greetd/config.toml"
echo "Copie as configurações:  cp -r dotfiles/* $HOME/.config"
echo "Atualizar firmware e rodar xdg-user-dirs-update"
