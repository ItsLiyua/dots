#!/bin/bash
if [ -z $(pidof wofi) ]; then
	wofi --show drun -p "Search..."
fi
