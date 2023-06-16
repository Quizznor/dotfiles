#!/usr/bin/env bash

get_updates () {
    checkupdates+aur | awk '{print $1}'
}

if [ -z "$1" ]; then

    MODULES=$(cat $HOME/system/.updates)

    case $MODULES in
        *"linux-headers"*)
        icon=update-high ;;
        "")
        icon="" ;;
        *)
        icon=update-none ;;
    esac

    echo "| iconName=$icon onclick=bash bash='$HOME/.config/scripts/update.sh update'"
else 
    konsole -e yay -Syu
    
    echo $(get_updates) > $HOME/system/.updates

fi