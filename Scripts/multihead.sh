#!/bin/bash

option="$1"

if [ "$option" = "poland-home" ]; then
    xrandr --output eDP-1 --auto --output DP-1-1-3 --auto --right-of eDP-1
fi
