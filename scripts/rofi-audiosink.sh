#!/usr/bin/env bash

# use pavucontrol to change the codec of the headset, if desired

PROMPT=("  \n  \n  ")
ADDR="98:52:3D:27:D1:02"
SINKNAME="bluez_sink.98_52_3D_27_D1_02.a2dp_sink"

SELECTED=$(echo -en "${PROMPT[@]}" | rofi -dmenu -theme audiosinks -p "Change audiosink" -l 5)

case $SELECTED in
  *""*)
  pacmd set-default-sink 0
  bluetoothctl power off
  ;;
  *""*)
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
