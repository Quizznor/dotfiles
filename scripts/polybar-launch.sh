#!/usr/bin/env bash

# Called by i3 config reload, restarts all polybars with the fitting config

killall -q polybar cbatticon nm-applet volumeicon
polybar --config=/home/quizznor/.config/polybar/config.ini main &

# also repopulate sys-tray with important status icons
# Simply add the application of your choice in TRAYVARS

TRAYVARS=("cbatticon" "nm-applet" "volumeicon")

for VAR in "${TRAYVARS[@]}"
do
  while [ "$(pidof $VAR)" == "" ]
  do
    $VAR &
  done
  sleep 0.1
done
