#!/bin/bash

#export SWWW_TRANSITION_TYPE=center
#export SWWW_TRANSITION_FPS=60
#export SWWW_TRANSITION_STEP=10
#export SWWW_TRANSITION_DURATION="0.4"

killall swww-daemon
swww-daemon&
