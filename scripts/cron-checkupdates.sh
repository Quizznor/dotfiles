#!/usr/bin/env bash

get_updates () {
    checkupdates+aur | awk '{print $1}' > $HOME/system/.updates
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

    echo "| iconName=$icon onclick=bash bash='$HOME/.config/scripts/cron-checkupdates.sh update'"
else
    if [ "$1" = "update" ]; then
        alacritty --config-file "$HOME/.config/alacritty/update.yml" -e yay -Syu
    fi

    get_updates
fi