#!/usr/bin/env bash

# requires:
#   dunst      'sudo pacman -S dunst'
#   alsa       'sudo pacman -S alsa-lib alsa-utils'
#   awk, tr    'sudo pacman -S gawk, ...'

# usage: i3-volume.sh <option>
#
# available options are:
#
#       "toggle"   - toggles Master channel
#       "increase" - increases volume
#       "decrease" - decreases volume

SPKERNAME="alsa_output.pci-0000_00_1f.3.analog-stereo" # Speaker sink name
HDPHNNAME="bluez_sink.98_52_3D_27_D1_02.a2dp_sink"   # Headphone sink name

case $1 in
"toggle")
    amixer --quiet sset Master toggle
    amixer --quiet sset Speaker on
    ;;
"+")
    pactl set-sink-volume @DEFAULT_SINK@ +1%
    ;;
"-")
    pactl set-sink-volume @DEFAULT_SINK@ -1%
    ;;
esac

VOL=$(amixer sget Master | awk 'NR==6{gsub(/[\[\]]/,""); print $5}')
STAT=$(amixer sget Master | awk '/off/')
if [ "$STAT" == "" ]; then
ICON=""
else ICON=""
fi

dunstify --urgency=low --replace 14875 "$ICON $VOL"
# aplay ~/downloads/got-it-done.mp3 --nonblock
