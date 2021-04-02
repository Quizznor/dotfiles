#!/usr/bin/env bash

OPTIONS=("" "\n" "\n" "\n" "\n")
SELECTED=$(echo -en "${OPTIONS[@]}" | rofi -dmenu -theme powermenu -p " System Option" -l 5)

case $SELECTED in
  *""*)
  systemctl poweroff
  ;;
  *""*)
  systemctl suspend
  ;;
  *""*)
  systemctl reboot
  ;;
  *""*)
  i3-msg exit
  ;;
  *""*)
  xautolock -locknow
  ;;
esac
