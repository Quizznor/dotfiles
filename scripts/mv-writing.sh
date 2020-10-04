#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":6/ {print}')

i3-msg workspace 6 > /dev/null

if [ "$STATUS" == "" ]
then
  i3-msg "workspace 6; append_layout $HOME/.config/i3/layout-writing.json"
  kitty --config=$HOME/.config/kitty/kitty.ini --directory=$HOME/writing/ &
  conky --config=$HOME/.config/conky/shortcuts.ini &
fi
