#!/usr/bin/env bash

TRAY_ICONS=2

if [[ ! -z "$(pidof zoom)" ]]; then
  let TRAY_ICONS=$TRAY_ICONS+6
fi

if [[ ! -z "$(pidof teams)" ]]; then
  let TRAY_ICONS=$TRAY_ICONS+5
fi

if [[ ! -z "$(lsblk | grep sdc)" ]]; then
  let TRAY_ICONS=$TRAY_ICONS+5
fi

if [[ ! -z "$(pidof vlc)" ]]; then
  let TRAY_ICONS=$TRAY_ICONS+5
fi

if [[ ! -z "$(pidof Discord)" ]]; then
  let TRAY_ICONS=$TRAY_ICONS+6
fi

SPACES=$(( 14 + $TRAY_ICONS ))

printf " |"
printf '%0.s ' $(seq 1 $SPACES)
