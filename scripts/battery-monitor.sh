#!/usr/bin/env bash

if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

BAT_LVL=$( cat /sys/class/power_supply/BAT0/capacity )
BAT_STAT=$( cat /sys/class/power_supply/BAT0/status)

if [[ $BAT_LVL -lt 20 && $BAT_STAT != "Charging" ]]
then
  dunstify --urgency=critical --replace 15983 " Battery low: $BAT_LVL% remaining"
fi
