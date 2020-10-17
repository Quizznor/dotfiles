#!/usr/bin/env bash

OPTIONS=$(pacmd list-sinks | awk -F"=" '/device.description/{gsub(/"/,"");print $2}')
PROMPT=(" " "\n  \n  ")
#PROMPT=(" BLAH" "\n sodg" "\nspdofj")

SELECTED=$(echo -en "${PROMPT[@]}" | rofi -dmenu -theme audiosinks -p "Please choose an audiosink" -l 5)

case $SELECTED in
  *""*)
  echo "Chose internal speakers"
  ;;
  *""*)
  echo "Chose bluetooth headset"
  ;;
  *""*)
  echo "Chose to list available sinks"


  i3-msg "exec kitty --config=$HOME/.config/kitty/kitty.ini; floating enable"
  ;;
esac
