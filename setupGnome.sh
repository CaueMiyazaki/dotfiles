#!/bin/bash

if [[ `whoami` != 'root' ]]
  then echo "Please run as root, sudo bash setupGnome.sh"
  exit
fi

# Update system
sudo pacman -Syu --noconfirm
sleep 0.5

# Install core packages
sudo pacman -S gdm gjs gnome-shell gnome-control-center gnome-keyring --noconfirm
sleep 0.5

# Install essential packages
sudo pacman -S ffmpeg ffmpeg4.4 ufw fwupd nano nvme-cli libdecor mesa vulkan-radeon --noconfirm
sleep 0.5

# Install apps
sudo pacman -S gnome-console gnome-logs gnome-text-editor gnome-system-monitor gnome-disk-utility loupe --noconfirm
sleep 0.5

clear
echo "Ativar ufw E gdm"
echo "Atualizar firmware e rodar xdg-user-dirs-update"
