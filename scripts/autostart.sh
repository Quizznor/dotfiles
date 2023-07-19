#!/usr/bin/env bash

# clean up activities 
rm -rf $HOME/system/icons/activities/*

# force KDE to use dunst
killall plasmashell
dunst &
plasmashell

# turn off bluetooth
echo -e "power off" | bluetoothctl

# open mail application
betterbird &
