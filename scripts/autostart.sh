#!/usr/bin/env bash

# clean up activities 
rm -rf $HOME/system/icons/activities/*

# force KDE to use dunst
killall plasmashell
dunst &
plasmashell

# turn off bluetooth
bluetoothctl power off

# open mail application
betterbird &
