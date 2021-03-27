#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":3,/ {print}')

if [ "$STATUS" == "" ]
then
    atom &

fi

i3-msg workspace 3 > /dev/null
