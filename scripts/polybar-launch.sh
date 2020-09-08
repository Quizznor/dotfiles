#!/usr/bin/env bash

# Called by i3 config reload, restarts all polybars with the fitting config

killall -q polybar
polybar --config=/home/quizznor/.config/polybar/config main
