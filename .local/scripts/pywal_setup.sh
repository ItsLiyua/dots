#!/bin/bash

wallpaper="/home/liyua/.local/share/wallpapers/$(ls ~/.local/share/wallpapers | shuf -n 1)"

wal -t -i "$wallpaper"
swww img --transition-type none "$wallpaper"
waybar
mako
.local/scripts/mako_setup.sh
.local/scripts/waybar_setup.sh
