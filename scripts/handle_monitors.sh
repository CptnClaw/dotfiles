#!/bin/bash

if [ $(xrandr --listmonitors | wc -l) = 4 ]; then
	xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x168 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x168 --rotate normal --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-2 --off
fi
