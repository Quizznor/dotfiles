#!/usr/bin/env bash

MODULES=$(checkupdates+aur | awk '{print $1}')

case $MODULES in
    *"arch"*)
    icon=update-high
    ;;
    "")
    icon=""
    ;;
    *)
    icon=update-none
    ;;
esac

echo "| iconName=$icon onclick=bash bash=$HOME/.config/scripts/update.sh"