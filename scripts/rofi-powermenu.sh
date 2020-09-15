#!/usr/bin/env bash

OPTIONS=("  Power off" "\n  Standby" "\n  Restart" "\n  Logout")
SELECTED=$(echo -en "${OPTIONS[@]}" | rofi -dmenu -theme powermenu -p " System Option" -l 4)

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
  *""*)
  i3-msg exit
  ;;
esac
