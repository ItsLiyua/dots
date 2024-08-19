#!/bin/bash

# killall waybar
HOST="$(uname -n)" envsubst < ~/.config/waybar/config.jsonc > /tmp/waybar.jsonc
pid=$(pidof waybar)
if [ "z$pid" = "z" ]; then
  waybar -c /tmp/waybar.jsonc -s ~/.config/waybar/style.css
fi

