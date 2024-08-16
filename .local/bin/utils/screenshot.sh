#!/bin/bash

mkdir ~/Pictures/screenshots -p
slurp | grim -t png -g - "$HOME/Pictures/screenshots/$(date +%Y-%m-%d_%H_%M_%S).png" | wl-copy
