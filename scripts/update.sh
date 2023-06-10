#!/usr/bin/env bash

if [ -z "$1" ]; then

    MODULES=$(cat $HOME/system/.updates)

    case $MODULES in
        *"arch"*)
        icon=update-high ;;
        "")
        icon="" ;;
        *)
        icon=update-none ;;
    esac

    echo "| iconName=$icon onclick=bash bash='$HOME/.config/scripts/update.sh update'"
else 
    konsole -e yay -Syu
    wmctrl -a yay
    echo "" > $HOME/system/.updates
fi