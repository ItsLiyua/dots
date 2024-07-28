#! /bin/bash

pamixer -d 1
if [ $(pamixer --get-volume) -le 0 ]; then
	pamixer -m
fi

