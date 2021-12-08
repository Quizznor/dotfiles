#!/usr/bin/env bash

echo "" > ~/.updates
UPDATES=$(( $(yay -Qu | wc -l) - 1 ))

if [ -n $1 ]
then
  echo $UPDATES
fi
