#!/usr/bin/env bash

ACTIVE=$(kactivities-cli --list-activities | grep CURRENT | awk '{print $3}')
FIRST=$(kactivities-cli --list-activities | grep RUNNING | awk 'NR==1 {print $3}')
SECOND=$(kactivities-cli --list-activities | grep RUNNING | awk 'NR==2 {print $3}')

if [ -z $1 ]; then

    scrot -o $HOME/system/icons/activities/$ACTIVE.png
    PROMPT=("$ACTIVE\n$SECOND\n$FIRST")

    conky -c $HOME/.config/conky/conky.conf &
    SELECTED=$(echo -en "${PROMPT[@]}" | rofi -dmenu -theme $HOME/.config/rofi/image-menu.rasi)
    killall conky

    if [ "$SELECTED" = "$ACTIVE" ]; then
        exit 0
    else
        ACTIVITY_ID=$(kactivities-cli --list-activities | grep $SELECTED | awk '{print $2}')
        kactivities-cli --set-current-activity $ACTIVITY_ID
    fi

else
    IMG_SECOND=~/system/icons/activities/$SECOND.png
    if [ ! -f "$IMG_SECOND" ]; then
        IMG_SECOND=~/system/images/Matterhorn.jpg
    fi

    IMG_FIRST=~/system/icons/activities/$FIRST.png
    if [ ! -f "$IMG_FIRST" ]; then
        IMG_FIRST=~/system/images/Matterhorn.jpg
    fi

    echo '${voffset 10}  Recent Activities'

    echo '${image ~/system/icons/activities/'"$ACTIVE"'.png -p 20, 40 -s 384x216}'
    echo '${image ~/system/icons/'"$ACTIVE"'.png -p 314, 201 -s 70x35}'

    echo '${image '"$IMG_SECOND"' -p 20, 266 -s 384x216}'
    echo '${image ~/system/icons/'"$SECOND"'.png -p 314, 427 -s 70x35}'

    echo '${image '"$IMG_FIRST"' -p 20, 492 -s 384x216}'
    echo '${image ~/system/icons/'"$FIRST"'.png -p 314, 653 -s 70x35}'
fi