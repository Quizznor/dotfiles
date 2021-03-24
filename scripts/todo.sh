#!/usr/bin/env bash

case $1 in
  "at")
  URGENCY="[TOP]"
  ;;
  "am")
  URGENCY="[MID]"
  ;;
  "ab")
  URGENCY="[BOT]"
  ;;
  "r")
  TASK=$(sed -n $2p $HOME/documents/todo.txt)
  sed -i $2d $HOME/documents/todo.txt
  echo $TASK >> $HOME/documents/todone.txt
  exit
  ;;
  *)
  echo "Bad specifier, try again"
  exit
esac

echo "$URGENCY ${@:2}" >> $HOME/documents/todo.txt
