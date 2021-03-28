#!/usr/bin/env bash

OPTIONS=(" " "\n " "\n " "\n ")
SELECTED=$(echo -en "${OPTIONS[@]}" | rofi -dmenu -theme controlprompt -p "Select a screen:" -l 4)

case $SELECTED in
  *""*)
  mons -o
  ;;
  *""*)
  mons -s
  ;;
  *""*)
  mons -m
  ;;
  *""*)
  mons -e right
  ;;
esac
