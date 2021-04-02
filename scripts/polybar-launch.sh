#!/usr/bin/env bash

# Called by i3 config reload, restarts all polybars with the fitting config

killall -q polybar cbatticon nm-applet volumeicon
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Make polybar appear on every monitor
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --config=/home/quizznor/.config/polybar/config.ini main & disown &
done

$m polybar --config=/home/quizznor/.config/polybar/config.ini main & disown &

# also repopulate sys-tray with important status icons
# Simply add the application of your choice in TRAYVARS.
# The script can handle additional starting parameters as shown.

TRAYVARS=("cbatticon -n" "nm-applet")

for VAR in "${TRAYVARS[@]}"
do
  while [ "$(pidof $(echo $VAR | awk '{print $1}'))" == "" ]
  do
    $VAR > /dev/null &
    sleep 0.1
  done
  sleep 1
done
