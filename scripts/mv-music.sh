#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":5/ {print}')

i3-msg workspace 5 > /dev/null

# if [ "$STATUS" == "" ]
# then
#   i3-msg "workspace 5; append_layout $HOME/.config/i3/layout-music.json"
#
# fi
