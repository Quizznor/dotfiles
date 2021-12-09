#!/usr/bin/env bash

if [ -z $1 ];
then
  # if not called directly from polybar, update package list
  echo "$(checkupdates)" > ~/.updates
else
  # display number of updates else
  echo "$(( $(cat ~/.updates | wc -l) - 1 ))"
fi
