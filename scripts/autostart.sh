#!/usr/bin/env bash

# clean up activities 
rm -rf $HOME/system/icons/activities/*

# force KDE to use dunst
killall plasmashell
dunst &
plasmashell > /dev/null 2>&1 &

# turn off bluetooth
echo -e "power off" | bluetoothctl

# open mail application
# betterbird &

# start work screen if large monitor is connected
if [[ ! -z "$( xrandr | grep 'HDMI1 connected')" ]]; then
    
    xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1
    kactivities-cli --set-current-activity "$(kactivities-cli --list-activities | grep Work | awk '{print $2}')"
    $HOME/.config/scripts/window_rules.py "work"

    wmctrl -s 1
    betterbird &
    # firefox & 

    wmctrl -s 0
    alacritty -T server-prompt -e ssh -CYt auger 'clear; echo "$(ps -ef | grep filip | wc -l) zombie processes active"; bash -l;' &
    alacritty -T server-htop -e ssh -t auger 'htop' &
    code-insiders &
    firefox &
else
    kactivities-cli --set-current-activity "$(kactivities-cli --list-activities | grep Home | awk '{print $2}')"
    $HOME/.config/scripts/window_rules.py "home"
fi
