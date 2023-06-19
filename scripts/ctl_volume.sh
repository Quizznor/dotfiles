#!/usr/bin/env bash

case $1 in 
"/")
pamixer -t ;;
"+")
pamixer -i 5 ;;
"-")
pamixer -d 5 ;;
esac

VOLUME=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)
APP="OSD"

if [ $MUTE = "true" ]; then
    ICON=/usr/share/icons/breeze-dark/status/22/audio-volume-muted.svg
    APP="OSD-mute"
else
    if [ $VOLUME == 0 ]; then
        ICON=/usr/share/icons/breeze-dark/status/22/audio-volume-muted.svg
    elif (( 0 <= $VOLUME && $VOLUME < 30 )); then
        ICON=/usr/share/icons/breeze-dark/status/22/audio-volume-low.svg
    elif (( 30 <= $VOLUME && $VOLUME < 60 )); then
        ICON=/usr/share/icons/breeze-dark/status/22/audio-volume-medium.svg
    elif (( 60 <= $VOLUME)); then
        ICON=/usr/share/icons/breeze-dark/status/22/audio-volume-high.svg
    fi
fi

notify-send -u low -r 1337 -a "$APP" -i $ICON "$VOLUME"
aplay --nonblock $HOME/system/sounds/volume.wav