#!/usr/bin/env bash

case $1 in
  "device_removed")
  LAST=$(cat /tmp/last_udisk_device.txt)
  NOTIFICATION="Removed $LAST"
  ;;
  "device_added")
  echo "$2" > /tmp/last_udisk_device.txt
  NOTIFICATION="Added $2"
  ;;
  "device_mounted")
  NOTIFICATION="Mounted $2"
  ;;
esac

dunstify --urgency=normal --replace=83465236 "$NOTIFICATION"
