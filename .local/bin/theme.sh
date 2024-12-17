#!/bin/bash

WALLPAPER_LOC="${HOME}/.local/share/wallpapers/"
WALLPAPER="$(find $WALLPAPER_LOC -type f | shuf -n 1)"

echo $WALLPAPER

swww img --resize crop --transition-type=center --transition-duration=1 --transition-fps=60 "$WALLPAPER"&

wallust run $WALLPAPER
