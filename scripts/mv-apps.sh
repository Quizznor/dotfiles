#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":10,/ {print}')

i3-msg workspace 10 > /dev/null

if [ "$STATUS" == "" ]
then
  rofi -show drun -theme apps
fi
