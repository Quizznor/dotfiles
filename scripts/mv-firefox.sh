#!/usr/bin/env bash

STATUS=$(i3-msg -t get_workspaces | awk '/"num":2/ {print}')

if [ "$STATUS" == "" ]
then
    firefox &

fi

i3-msg workspace 2 > /dev/null
