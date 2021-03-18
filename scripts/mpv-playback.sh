#!/usr/bin/env sh

if [ -z $(pidof mpv) ]; then
  # start mpv with desired parameters
  mpv --quiet --force-window=yes --keep-open=yes --volume=50 --input-ipc-server=/tmp/mpv-socket $@ > /dev/null & disown
  sleep 0.3 && i3-msg "[title=RANGER] focus"
else
  # append to playlist if its already running
  echo "loadfile $@ append-play" | socat - /tmp/mpv-socket &
fi
