#!/bin/bash

state="$(bluetoothctl show | grep "PowerState:" | grep -oE "on|off")"
if [ "$state" = "off" ]; then
	bluetoothctl power on
elif [ "$state" = "on" ]; then
	bluetoothctl power off
fi

