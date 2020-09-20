#!/usr/bin/env bash

# check for internet connection first
wget -q --spider http://google.com

#echo " "

if [ $? -ne 0 ]; then
    echo " ?"
    exit
fi

PCM_NR=$(checkupdates | wc -l)
AUR_NR=$(checkupdates-aur | wc -l)

case $1 in
  "")
  echo " $(( $PCM_NR + $AUR_NR ))"
  ;;
  "PCM")
  checkupdates | awk '{print $1,$4}' | rofi -dmenu -p "PCM: $PCM_NR updates available" -theme updates -l 3
  ;;
  "AUR")
  checkupdates-aur | awk '{print $1,$4}' | rofi -dmenu -p "AUR: $AUR_NR updates availabme" -theme updates -l 3
  ;;
  # TODO: set up update functionality on click event?
esac
