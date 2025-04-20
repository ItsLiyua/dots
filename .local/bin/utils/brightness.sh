#!/bin/bash

if [ "$1" = "up" ]; then
	if [ -n "$2" ]; then
		brightnessctl s "+$2"
	else
		brightnessctl s "+5%"
	fi
elif [ "$1" = "down" ]; then
	if [ -n "$2" ]; then
		brightnessctl s "$2-"
	else
		brightnessctl "5%-"
	fi
elif [ "$1" = "get" ]; then
	brightnessctl g
elif [ "$1" = "max" ]; then
	brightnessctl m
elif [ "$1" = "percentage" ]; then
	jq -n "$(brightnessctl g) / $(brightnessctl m)"
elif [ "$1" = "check" ]; then
	brightnessctl -c backlight > /dev/null
	echo $?
else
	brightnessctl s "$1"
fi

