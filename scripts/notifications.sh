#!/usr/bin/env bash

if [ -z "$(pidof dunst)" ]; then
    PROMPT="      Restart dunst"
    ICON="notifications-disabled"
else
    PROMPT="      Do not disturb\n      Show history"
    ICON="notifications"
fi

if [ -z "$1" ]; then
    echo "| iconName=$ICON onclick=bash bash='$HOME/.config/scripts/notifications.sh click'"
else
    SELECTED=$(echo -en "${PROMPT[@]}" | rofi -dmenu -theme $HOME/.config/rofi/notification-menu.rasi)

    case $SELECTED in
    "      Do not disturb")
        killall dunst ;;

    "      Show history")
        for i in {1..20}; do xdotool key ctrl+grave; done ;;

    "      Restart dunst")
        dunst & ;;
    esac

fi