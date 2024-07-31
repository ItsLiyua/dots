#!/bin/bash

killall swww-daemon
swww-daemon
swww img --transition-type none $@
