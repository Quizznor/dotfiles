#!/usr/bin/env sh

if [ -z $(pidof mpv) ]; then
  # start mpv with desired parameters
  mpv --force-window=yes --keep-open=yes --input-ipc-server=/tmp/mpv-socket $@ &
else
  # append to playlist if its already running
  echo "loadfile $@ append-play" | socat - /tmp/mpv-socket &
fi
