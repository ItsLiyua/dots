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
fi

