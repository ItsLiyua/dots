#!/bin/bash

DIR="$XDG_DATA_HOME/wallpapers/"
WALLPAPER="$(ls "$DIR" | wofi -d -p "Select Wallpaper")"

if [ "f$WALLPAPER" == "f" ]; then
  echo No Wallpaper selected
else
~/.local/bin/theme/theme.sh "$DIR$WALLPAPER"
fi
