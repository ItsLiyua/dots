#!/bin/bash

if [ -z $(pidof swww-daemon) ]; then
  swww-daemon&
  sleep 1
fi

PWF_LOCK_FILE="/tmp/theme/pywalfox"
if [ ! -f "$PWF_LOCK_FILE" ]; then
  pywalfox start&
  mkdir -p "$(dirname "$PWF_LOCK_FILE")"
  touch "$PWF_LOCK_FILE"
  sleep 0.5
  echo "PWF started"
else
  echo "PWF already present"
fi

WALLPAPER_LOC="${HOME}/.local/share/wallpapers/"
WALLPAPER="$(find $WALLPAPER_LOC -type f | shuf -n 1)"

swww img --resize crop --transition-type=wipe --transition-angle=30 --transition-duration=1 --transition-fps=60 --transition-bezier=0.75,0,0.25,1 "$WALLPAPER"&

wallust run "$WALLPAPER"

pywalfox update
