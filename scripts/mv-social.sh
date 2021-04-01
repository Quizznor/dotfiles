#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":6,/ {print}')

i3-msg workspace 6 > /dev/null

if [ "$STATUS" == "" ]
then
  discord &
fi
