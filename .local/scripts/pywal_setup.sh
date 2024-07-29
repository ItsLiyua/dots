#!/bin/bash

wallpaper="/home/liyua/.local/share/wallpapers/$(ls ~/.local/share/wallpapers | shuf -n 1)"

swww img --transition-type none "$wallpaper"&
wal -t -i "$wallpaper"
waybar
mako
.local/scripts/mako_setup.sh
.local/scripts/gtk_kvantum.sh
