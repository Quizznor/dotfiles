#!/usr/bin/env bash

case $1 in
  "+")
  brightnessctl s +1% > /dev/null
  ;;
  "-")
  brightnessctl s 1%- > /dev/null
  ;;
esac

BRIGHTNESS=$(brightnessctl | awk 'NR==2{gsub(/[\(\)]/,""); print $4}')

dunstify "$BRIGHTNESS"
