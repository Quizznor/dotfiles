#!/usr/bin/env bash

if [ -z "$1"]; then

    activity=$(kactivities-cli --current-activity | awk '{print $3}')

    case $activity in
        "Work")
        ICON=$(cat $HOME/system/icons/Work-64) ;;
        "Home") 
        ICON=$(cat $HOME/system/icons/Home-64) ;;
        "Fun")
        ICON=$(cat $HOME/system/icons/Fun-64) ;;
        *)
        ICON=application-x-plasma ;;
    esac

    echo "| image=$ICON imageWidth=40 imageHeight=20 bash='$HOME/.config/scripts/powermenu.sh exit' onclick=bash"
else
    if [ -f "/var/lib/pacman/db.lck" ]; then
        ACTION=$(notify-send -a "Update" --action="default, goto" "Update in progress!")
        
        if [ $ACTION = "0" ]; then
            wmctrl -a yay
        fi

    else
        qdbus org.kde.ksmserver /KSMServer logout 1 2 1
    fi
fi





