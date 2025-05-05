#!/bin/bash

NAME="$HOME/Pictures/screenshots/screenshot_$(date +%Y%m%d_%Hh%Mm%Ss).png"
DIR="$(dirname $NAME)"
mkdir -p "$DIR"

if [[ $* == *-s* ]]; then
	if [ -z $(pidof slurp) ]; then
		SELECTION="$(slurp)"
	else
		exit -1
	fi
fi

if [ -z $(pidof grim) ] ; then
	if [ "$SELECTION" ]; then
		grim -g "$SELECTION" -t png "$NAME"
	else
		grim -t png "$NAME"
	fi
else
	exit -1
fi

wl-copy < "$NAME"
