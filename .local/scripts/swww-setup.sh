#!/bin/bash
export SWWW_TRANSITION=center
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=10

killall swww-daemon
swww-daemon&
mkdir -p "/tmp/swww"
echo "1" > /tmp/swww/status
