#!/usr/bin/env bash

OPTIONS=("  Power off" "\n  Standby" "\n  Restart" "\n  Logout")

case $1 in
  "")
  echo ""
  ;;
  "open")
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
  ;;
esac
