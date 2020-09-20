#!/usr/bin/env bash

killall dunst
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done
dunst -config=$HOME/.config/dunst/dunstrc
