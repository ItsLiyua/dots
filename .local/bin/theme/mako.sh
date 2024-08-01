#!/bin/bash

cp -p ~/.cache/wal/mako.conf ~/.config/mako/config

if [ $(pidof mako) ]; then
	makoctl reload
	echo "Mako already running."
else
	mako&
	echo "Mako started."
fi

