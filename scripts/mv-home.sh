#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":1/ {print}')

i3-msg workspace 1 > /dev/null

if [ "$STATUS" == "" ]
then
  i3-msg "workspace 1; append_layout /home/quizznor/.config/i3/layout-home.json"
  kitty --config=$HOME/.config/kitty/kitty.ini &
  conky --config=$HOME/.config/conky/todo.ini &
fi
