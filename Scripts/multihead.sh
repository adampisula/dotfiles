#!/bin/bash

option="$1"

if [ "$option" = "pl-home" ]; then
    xrandr --output eDP-1 --auto --output DP-1-1-3 --auto --right-of eDP-1
elif [ "$option" = "pl-home-office" ]; then
    xrandr --output eDP --auto --output DisplayPort-4 --auto --right-of eDP
elif [ "$option" = "office" ]; then
    xrandr --output eDP --auto --output DisplayPort-1 --auto --above eDP
fi
