#!/bin/bash

if [ ! $(pidof swww-daemon) ]; then
	swww-daemon&
	echo "Starting SWWW daemon."
else
	echo "SWWW already running."
fi
swww img --transition-type none --transition-duration 0 "$@"
