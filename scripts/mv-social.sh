#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":6/ {print}')
PROMPT=("  \n  \n  ")

i3-msg workspace 6 > /dev/null

if [ "$STATUS" == "" ]
then
  SELECTED=$(echo -en "${PROMPT[@]}" | rofi -dmenu -theme audiosinks -p "What do you want to do?" -l 5)

  case $SELECTED in
    *""*)
    discord &
    ;;
    *""*)
    teams &
    ;;
    *""*)
    zoom &
    ;;
  esac
fi
