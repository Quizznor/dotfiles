#!/usr/bin/env bash

mv "$@" $HOME/.trash/
find $HOME/.trash/* -mtime +7 -exec rm -rf {} \;
