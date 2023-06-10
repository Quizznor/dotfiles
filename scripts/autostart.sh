#!/usr/bin/env bash

killall plasmashell

dunst &
rm -rf $HOME/system/icons/activities/*

plasmashell