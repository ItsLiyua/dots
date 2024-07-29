#!/bin/bash

wallpaper="/home/liyua/.local/share/wallpapers/$(ls ~/.local/share/wallpapers | shuf -n 1)"

wal -t -i "$wallpaper"
swww img --transition-type none "$wallpaper"
waybar
.local/scripts/waybar_setup.sh
mako
.local/scripts/mako_setup.sh
