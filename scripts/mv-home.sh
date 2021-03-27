#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":1,/ {print}')

i3-msg workspace 1 > /dev/null

if [ "$STATUS" == "" ]
then
  i3-msg "workspace 1; append_layout $HOME/.config/i3/layout-home.json"
  kitty &
  conky --config=$HOME/.config/conky/todo.ini &
fi
