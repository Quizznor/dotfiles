#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "| iconName=notifications onclick=bash bash='$HOME/.config/scripts/dunst-history.sh click'"
else
    for i in {1..20}; do 
        xdotool key ctrl+grave 
    done
fi