#!/usr/bin/env bash

if [[ -z $1 ]]
then
  echo "Bad document name. Please try again" && exit
fi

if [ ! -z "$(i3-msg -t get_workspaces | awk '/"num":4/ {print}')" ]
then
  i3-msg "workspace 4; focus parent; kill" > /dev/null
  i3-msg "workspace 1" > /dev/null
fi

mv-writing.sh "$HOME/Documents/$1"
