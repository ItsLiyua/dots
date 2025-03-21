#!/bin/bash

# doas pacman -Syu
# doas pacman -S base-devel
#
# git clone https://aur.archlinux.org/yay.git
# cd yay
# makepkg -si
#
yay -S \
	ly cmake cpio meson glaze pkg-config hyprland-git hyprpolkitagent-git xdg-desktop-portal-hyprland-git hyprlock-git hypridle-git jq \
	cliphist wl-clipboard \
	btop rocm-smi-lib \
	dunst \
	aylurs-gtk-shell \
	kitty fzf npm ripgrep ttf-jetbrains-mono-nerd zsh zoxide oh-my-posh \
	nautilus-share nautilus-image-converter nautilus \
	mpv-mpris playerctl \
	zen-browser-bin \
	aylurs-gtk-shell \
	wallust imagemagick swww \
	bibata-cursor-git

# systemctl enable ly

# hyprpm update
# hyprpm add https://github.com/Duckonaut/split-monitor-workspaces -v
# hyprpm enable split-monitor-workspaces -v
# hyprpm reload

ags types
