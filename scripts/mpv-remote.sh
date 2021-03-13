#!/usr/bin/env/sh

case $1 in
  "toggle")
  echo 'cycle pause' | socat - /tmp/mpv-socket
  ;;
  "next")
  echo 'playlist-next' | socat - /tmp/mpv-socket
  ;;
  "prev")
  echo 'playlist-prev' | socat - /tmp/mpv-socket
  ;;
esac
