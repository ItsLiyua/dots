#!/bin/bash

xhost +SI:localuser:root
doas "$@"
xhost -SI:localuser:root
