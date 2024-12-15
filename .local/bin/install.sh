#!/bin/bash

doas pacman -Syu
doas pacman -S base-devel

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

doas yay -S \
  btop rocm-smi-lib \
  ly cmake cpio cronie hyprland-git hyprpolkitagent-git xdg-desktop-portal-hyprland-git hyprsunset-git \
  wallust imagemagick \
  fzf npm ttf-jetbrains-mono-nerd zsh zoxide

systemctl enable --now cronie
systemctl enable ly

hyprpm update
hyprpm add https://github.com/Duckonaut/split-monitor-workspaces -v
hyprpm enable split-monitor-workspaces -v
hyprpm reload
