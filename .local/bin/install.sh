#!/bin/bash

# doas pacman -Syu
# doas pacman -S base-devel
#
# git clone https://aur.archlinux.org/yay.git
# cd yay
# makepkg -si
#
yay -S \
  btop rocm-smi-lib \
  ly cmake cpio hyprland-git hyprpolkitagent-git xdg-desktop-portal-hyprland-git \
  cliphist wl-clipboard \
  wallust imagemagick swww \
  kitty fzf npm ttf-jetbrains-mono-nerd zsh zoxide \
  nautilus-share nautilus-image-converter nautilus

# systemctl enable ly

# hyprpm update
# hyprpm add https://github.com/Duckonaut/split-monitor-workspaces -v
# hyprpm enable split-monitor-workspaces -v
# hyprpm reload
