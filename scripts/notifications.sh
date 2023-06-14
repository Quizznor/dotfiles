#!/usr/bin/env bash

DISTURB="      ENABLE NOTIFICATIONS      (restart dunst)"
DO_NOT_DISTURB="      DO NOT DISTURB                           (kill dunst)"

if [ -z "$(pidof dunst)" ]; then
    ICON="notifications-disabled"
    PROMPT=$DISTURB
else
    PROMPT=$DO_NOT_DISTURB
    ICON="notifications"
fi

if [ -z "$1" ]; then
    echo "| iconName=$ICON onclick=bash bash='$HOME/.config/scripts/notifications.sh click'"
else
    for i in {1..5}; do xdotool key ctrl+grave; done

    SELECTED=$(echo -en "${PROMPT[@]}" | rofi -dmenu -theme $HOME/.config/rofi/notification-menu.rasi)
    
    if [ "$PROMPT" = "$DO_NOT_DISTURB" ]; then
        dunstctl close-all
    fi

    case $SELECTED in
    $DO_NOT_DISTURB)
        killall dunst ;;
    $DISTURB)
        dunst & ;;
    esac

fi