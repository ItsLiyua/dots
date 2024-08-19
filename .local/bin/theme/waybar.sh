#!/bin/bash

# killall waybar
HOST="$(uname -n)" envsubst < ~/.config/waybar/config.jsonc > /tmp/waybar.jsonc
# Moved waybar launch to hypr/autostart.conf
# waybar -c /tmp/waybar.jsonc&

