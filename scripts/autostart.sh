#!/usr/bin/env bash

# clean up activities 
rm -rf $HOME/system/icons/activities/*

# force KDE to use dunst
killall plasmashell
dunst &
plasmashell &

# turn off bluetooth
echo -e "power off" | bluetoothctl

# open mail application
betterbird &

# start work screen if large monitor is connected
if [[ ! -z "$( xrandr | grep HDMI1)" ]]; then
    
    xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1
    kactivities-cli --set-current-activity "$(kactivities-cli --list-activities | grep Work | awk '{print $2}')"

    wmctrl -s 1
    alacritty -T server-htop &
    alacritty -T server-prompt &
    code-insiders &
    firefox &
fi