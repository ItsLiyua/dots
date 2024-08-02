#!/bin/bash

wallpaper="/home/liyua/.local/share/wallpapers/$(ls ~/.local/share/wallpapers | shuf -n 1)"

~/.local/bin/theme/swww.sh "$wallpaper"&

# Colorscheme
wal -t -i "$wallpaper"

~/.local/bin/theme/waybar.sh&
~/.local/bin/theme/icons.py&
~/.local/bin/theme/kvantum.sh&
~/.local/bin/theme/libadw.sh&
~/.local/bin/theme/mako.sh&
~/.local/bin/theme/hyprland.sh&
~/.local/bin/theme/pywalfox.sh&
~/.local/bin/theme/discord.sh&
~/.local/bin/theme/zathura.sh&

