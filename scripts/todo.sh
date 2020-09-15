#!/usr/bin/env bash

case $1 in
  "ae")
  URGENCY="[RELAX ]"
  ;;
  "am")
  URGENCY="[MEDIUM]"
  ;;
  "au")
  URGENCY="[URGENT]"
  ;;
  "r")
  TASK=$(sed -n $2p $HOME/Documents/todo.txt)
  sed -i $2d $HOME/Documents/todo.txt
  echo $TASK >> $HOME/Documents/todone.txt
  exit
  ;;
  *)
  echo "Bad specifier, try again"
  exit
esac

echo "$URGENCY ${@:2}" >> $HOME/Documents/todo.txt
