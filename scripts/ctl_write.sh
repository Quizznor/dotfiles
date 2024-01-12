#!/usr/bin/env bash

wmctrl -s 3

alacritty --config-file $HOME/.config/alacritty/ranger.toml -T "writing" -e "ranger" "$HOME/latex/"