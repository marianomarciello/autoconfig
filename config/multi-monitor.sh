#!/bin/bash

direction="--right-of"
monitor="HDMI1"
external_monitor=$(xrandr --query | grep $monitor)
if [[ $external_monitor = *connected* ]]; then
    xrandr --output HDMI1 --mode 1920x1080 -r 60.0 $direction eDP1
fi
