#!/usr/bin/env bash
# Terminate already running bar instances
killall -q polybar

#launch polybar
echo "[`date`]" | tee -a /tmp/toppolybar.log
polybar example 2> /tmp/toppolybar.log
