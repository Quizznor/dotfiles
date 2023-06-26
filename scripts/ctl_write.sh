#!/usr/bin/env bash

wmctrl -s 3

alacritty --config-file $HOME/.config/alacritty/ranger.yml -e "ranger" "$HOME/latex/"