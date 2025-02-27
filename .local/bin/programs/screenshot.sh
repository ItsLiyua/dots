#!/bin/bash

if [ -z $(pidof grim) ] && [ -z $(pidof slurp) ]; then
	grim -g "$(slurp)" -t png -o ~/Pictures/screenshots/screenshot_$(date +%Y_%m_%d_%H_%M%_S).png | wl-copy
fi
