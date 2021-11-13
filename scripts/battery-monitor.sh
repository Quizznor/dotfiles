#!/usr/bin/env bash

if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

BAT_LVL=$( cat /sys/class/power_supply/BAT0/capacity )

if [ $BAT_LVL -lt 10 ]
then
  dunstify --urgency=critical --replace 15983 " Battery low: $BAT_LVL% remaining"
fi
