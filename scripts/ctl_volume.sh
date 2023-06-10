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

if [ $MUTE = "true" ]; then
    ICON=/usr/share/icons/breeze-dark/status/22/audio-volume-muted.svg
else
    if (( 0 <= $VOLUME && $VOLUME < 30 )); then
        ICON=/usr/share/icons/breeze-dark/status/22/audio-volume-low.svg
    elif (( 30 <= $VOLUME && $VOLUME < 60 )); then
        ICON=/usr/share/icons/breeze-dark/status/22/audio-volume-medium.svg
    elif (( 60 <= $VOLUME)); then
        ICON=/usr/share/icons/breeze-dark/status/22/audio-volume-high.svg
    fi
fi

notify-send -u low -r 1337 -a 'OSD' -i $ICON -h int:value:$VOLUME " "
aplay -N $HOME/system/sounds/volume.wav