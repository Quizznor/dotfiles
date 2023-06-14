#!/usr/bin/env bash

wmctrl -s 3

alacritty -e "ranger" "$HOME/latex/master-thesis/thesis"