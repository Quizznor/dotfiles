#!/usr/bin/env bash

OPTIONS=("" "\n" "\n" "\n" "\n")
SELECTED=$(echo -en "${OPTIONS[@]}" | rofi -dmenu -theme powermenu -p " System Option" -l 5)

function check_abort_action {
  if [ -f "/var/lib/pacman/db.lck" ]; then
    dunstify --urgency=critical --replace 40195 "Update in progress!"
    exit 1
  fi
}

case $SELECTED in
  *""*)
  check_abort_action
  systemctl poweroff
  ;;
  *""*)
  check_abort_action
  systemctl suspend
  ;;
  *""*)
  check_abort_action
  systemctl reboot
  ;;
  *""*)
  check_abort_action
  i3-msg exit
  ;;
  *""*)
  xautolock -locknow
  ;;
esac
