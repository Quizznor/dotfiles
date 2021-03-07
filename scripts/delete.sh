#!/usr/bin/env bash

cp -r $1 $HOME/trash/$1 && rm -rf $1
find $HOME/trash/* -mtime +7 -exec rm -rf {} \;
