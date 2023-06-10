#!/usr/bin/env bash

case $1 in 
"+")
brightnessctl set +5% > /dev/null ;;
"-")
brightnessctl set 5%- > /dev/null ;;
esac

ICON="/usr/share/icons/breeze-dark/actions/16/view-visible.svg"
BRIGHTNESS=$(brightnessctl | awk 'NR==2{gsub(/[\(\)%]/,""); print $4}')
notify-send -u low -r 1337 -a 'OSD' -i $ICON -h int:value:$BRIGHTNESS " "