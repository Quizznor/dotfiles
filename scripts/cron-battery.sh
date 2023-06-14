#!/usr/bin/env bash

STATUS=$(cat /sys/class/power_supply/BAT0/status)
CHARGE_NOW=$(cat /sys/class/power_supply/BAT0/charge_now)
CHARGE_FULL=$(cat /sys/class/power_supply/BAT0/charge_full)
PERCENTAGE=$(( 100 * $CHARGE_NOW / $CHARGE_FULL ))

MESSAGE="Only $PERCENTAGE% battery remaining!" 
BODY="Run to the next power plug"

if [[ $PERCENTAGE -lt 20 && "$STATUS" = "Discharging" ]]; then
    aplay $HOME/system/sounds/warning.wav &
    XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send -a "Battery" -u "critical" "$MESSAGE" "$BODY"
fi
