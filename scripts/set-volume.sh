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

case $1 in
"toggle")
    amixer --quiet sset Master toggle
    amixer --quiet sset Speaker on
    ;;
"+")
    amixer --quiet sset Master 2+
    ;;
"-")
    amixer --quiet sset Master 2-
    ;;
*)
    echo
    echo  "usage: i3-volume.sh <option>"
    echo "available options are:"
    echo
    echo "  toggle      - mute/unmute Master Channel"
    echo "  increase    - increase global volume"
    echo "  decrease    - decrease global volume"
    echo
    exit 1
    ;;
esac

VOL=$(amixer sget Master | awk '/%/ {gsub(/[\[\]]/,""); print $4}')
STAT=$(amixer sget Master | awk '/off/')
if [ "$STAT" == "" ]; then
ICON=""
else ICON=""
fi

dunstify --urgency=low --replace 14875 " $ICON $VOL "
aplay ~/storage/sounds/sound_notification.wav --nonblock
