#!/bin/bash

wallpaper="/home/liyua/.local/share/wallpapers/$(ls ~/.local/share/wallpapers | shuf -n 1)"

swww img --transition-type none "$wallpaper"&
wal -t -i "$wallpaper"
killall waybar
waybar&
~/.local/scripts/mako_setup.sh
~/.local/scripts/gtk_kvantum.sh
~/.local/scripts/icons.py
