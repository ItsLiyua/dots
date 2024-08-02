#!/bin/bash

killall waybar
HOST="$(uname -n)" envsubst < ~/.config/waybar/config.jsonc > /tmp/waybar.jsonc
waybar -c /tmp/waybar.jsonc&

