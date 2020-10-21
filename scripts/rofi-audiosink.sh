#!/usr/bin/env bash

PROMPT=(" " "\n  \n  ")
ADDR="28:9A:4B:19:A1:CF"
SINKNAME="bluez_sink.28_9A_4B_19_A1_CF.a2dp_sink"

SELECTED=$(echo -en "${PROMPT[@]}" | rofi -dmenu -theme audiosinks -p "Change audiosink" -l 5)

case $SELECTED in
  *""*)
  pacmd set-default-sink 0
  bluetoothctl power off
  ;;
  *""*)
  echo -e "power on\nagent on\nconnect $ADDR" | bluetoothctl

  # still for some reason this only works on the second try?
  while [ -z "$(pacmd list-sinks | awk '/bluez/{print}')" ]
  do
    sleep 1
  done

  pacmd set-default-sink $SINKNAME
  ;;
  *""*)
  kitty --config=$HOME/.config/kitty/kitty.ini --title="floatterm" --hold pacmd list-sinks
  ;;
esac
