#!/usr/bin/env bash

STATUS=$(cat /sys/class/power_supply/BAT0/status)
CHARGE_NOW=$(cat /sys/class/power_supply/BAT0/charge_now)
CHARGE_FULL=$(cat /sys/class/power_supply/BAT0/charge_full)
PERCENTAGE=$(( 100 * $CHARGE_NOW / $CHARGE_FULL ))

if [[ $PERCENTAGE -lt 15 && "$STATUS" = "Discharging" ]]; then
    aplay -N $HOME/system/sounds/warning.wav &
    notify-send -a "Battery" -u "critical" "$PERCENTAGE% battery remaining!" "Run to the next power plug"
fi
