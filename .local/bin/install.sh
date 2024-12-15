#!/bin/bash

doas pacman -Syu
doas pacman -S base-devel

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

doas yay -S \
  btop rocm-smi-lib \
  cmake cpio hyprland-git hyprpolkitagent-git xdg-desktop-portal-hyprland-git \
  fzf npm ttf-jetbrains-mono-nerd zsh zoxide

hyprpm update
hyprpm add https://github.com/Duckonaut/split-monitor-workspaces -v
hyprpm enable split-monitor-workspaces -v
hyprpm reload
