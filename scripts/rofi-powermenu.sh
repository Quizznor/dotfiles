#!/usr/bin/env bash

case $1 in
  "")
  echo ""
  ;;
  "open")
  rofi -dmenu -theme powermenu -p "test"
  ;;
esac
