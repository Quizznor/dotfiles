#!/usr/bin/env bash

# mv would result in the age of the file not being updated,
# which in some cases means immediate deletion, very sad =(
cp -r "$@" $HOME/.trash/
rm -rf "$@"

find $HOME/.trash/* -mtime +7 -exec rm -rf {} \;
