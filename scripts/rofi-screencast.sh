#!/usr/bin/env bash

OPTIONS=(" " "\n " "\n " "\n ")
SELECTED=$(echo -en "${OPTIONS[@]}" | rofi -dmenu -theme screencast -p "Select a screen:" -l 4)

case $SELECTED in
  *""*)
  mons -o
  # echo "Laptop"
  ;;
  *""*)
  mons -s
  # echo "Fernseher"
  ;;
  *""*)
  mons -m
  # echo "Mirror"
  ;;
  *""*)
  mons -e right
  # echo "Extend"
  ;;
esac
