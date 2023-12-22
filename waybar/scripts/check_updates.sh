#!/bin/bash
i="$(checkupdates | wc -l)"

if [ $i != "0" ]; then
    alacritty -e update
    i="$(checkupdates | wc -l)"
    echo " $i" > $HOME/.updates
else
    echo > $HOME/.updates
    if [ ! -z $1 ]; then
        notify-send "System is up to date =)"
    fi
fi
