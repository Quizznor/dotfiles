#!/usr/bin/env bash

OPTIONS=("  Power off" "\n  Standby" "\n  Restart" "\n  Logout" "\n  Lock")
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
  *""*)
  i3-msg exit
  ;;
  *""*)
  $HOME/.config/scripts/lockscreen.sh --nofork -- scrot -z -o -d 1
esac
