#!/bin/bash

swww-daemon

WALLPAPER_LOC="${HOME}/.local/share/wallpapers/"
WALLPAPER="$(find $WALLPAPER_LOC -type f | shuf -n 1)"

echo $WALLPAPER

swww img --resize crop --transition-type=wipe --transition-angle=30 --transition-duration=1 --transition-fps=60 --transition-bezier=0.75,0,0.25,1 "$WALLPAPER"&

wallust run $WALLPAPER
