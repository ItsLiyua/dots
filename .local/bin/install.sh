#!/bin/bash

doas pacman -S btop cmake cpio fzf npm rocm-smi-lib ttf-jetbrains-mono-nerd zsh zoxide

hyprpm update
hyprpm add https://github.com/Duckonaut/split-monitor-workspaces -v
hyprpm enable split-monitor-workspaces -v
hyprpm reload
