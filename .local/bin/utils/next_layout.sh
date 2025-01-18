#!/bin/bash

hyprctl switchxkblayout all next
notify-send "Switched Keybord Layout" "$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')"
