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
  # Attempt to connect to the headset. Timeout after 10 seconds (~9-10 retries)
  RUNTIME=$((SECONDS+10))
  while [[ -z "$(pacmd list-sinks | awk '/bluez/{print}')" && $SECONDS -lt $RUNTIME ]]
  do
    echo $SECONDS
    echo -e "power on\nagent on" | bluetoothctl
    echo -e "connect $ADDR" | bluetoothctl
    sleep 1
  done

  pacmd set-default-sink $SINKNAME

  ;;
  *""*)
  kitty --config=$HOME/.config/kitty/kitty.conf --title="floatterm" --hold pacmd list-sinks
  ;;
esac
