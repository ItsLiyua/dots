#!/bin/bash


pick_random_wallpaper() {
  wallpaper="/home/liyua/.local/share/wallpapers/$(ls ~/.local/share/wallpapers | shuf -n 1)"
}

pick_random_wallpaper
if [ "$wallpaper" = $'$(cat ~/.cache/wal/wal)\n' ] && [ "$(ls -l | wc -l)" -gt "2" ]; then
  echo "Picked same wallpaper as before. Repicking."
  pick_random_wallapper
fi

if [ ! -f /tmp/swww/status ]; then
  ./swww-setup.sh
fi

(wal -i "$wallpaper"&)
swww img "$wallpaper"
