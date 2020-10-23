#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":4/ {print}')

if [ -z $1 ]; then
  CMD="--directory=$HOME/writing/ ranger"
else
  CMD="vim $1"
fi

i3-msg workspace 4 > /dev/null

if [ "$STATUS" == "" ]
then
  i3-msg "workspace 4; append_layout $HOME/.config/i3/layout-writing.json"
  kitty --config=$HOME/.config/kitty/kitty-vim.ini $CMD &
fi
