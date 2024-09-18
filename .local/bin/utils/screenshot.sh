#!/bin/bash

mkdir ~/Pictures/screenshots -p
if [ ! -f "/tmp/screenshot_state" ]; then
  touch /tmp/screenshot_state
  slurp | grim -t png -g - "$HOME/Pictures/screenshots/$(date +%Y-%m-%d_%H_%M_%S).png" | wl-copy
  rm /tmp/screenshot_state
fi
