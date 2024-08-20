#!/bin/bash

if [ -z "$1" ]; then
	wallpaper="/home/liyua/.local/share/wallpapers/$(ls ~/.local/share/wallpapers | shuf -n 1)"
else 
	wallpaper="$1"
fi


~/.local/bin/theme/swww.sh "$wallpaper" > /dev/null &

# Colorscheme
wal -t -i "$wallpaper" > /dev/null

~/.local/bin/theme/waybar.sh > /dev/null &
~/.local/bin/theme/kvantum.sh > /dev/null &
~/.local/bin/theme/libadw.sh > /dev/null &
~/.local/bin/theme/mako.sh > /dev/null &
~/.local/bin/theme/hyprland.sh > /dev/null &
~/.local/bin/theme/pywalfox.sh > /dev/null &
~/.local/bin/theme/discord.sh > /dev/null &
~/.local/bin/theme/icons.py > /dev/null &

