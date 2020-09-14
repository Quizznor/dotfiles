#!/usr/bin/env bash

DATEFTM="${DATEFTM:-+%a. %d. %b. %Y}"
SHORTFMT="${SHORTFMT:-+%d.%m.%Y}"
LABEL="${LABEL}"
blockdate=$(date "$DATEFTM")
shortblockdate=$(date "$SHORTFMT")

year=$(date '+%Y')
month=$(date '+%m')
date=$(date '+%A, %d. %B')

export TERM=xterm
cal --color=always $month $year \
    | sed 's/\x1b\[[7;]*m/\<b\>\<u\>/g' \
    | sed 's/\x1b\[[27;]*m/\<\/u\>\<\/b\>/g' \
    | tail -n +2 \
    | rofi \
        -dmenu \
        -markup-rows \
        -no-fullscreen \
        -font "Monospace 13" \
        -theme Paper \
        -hide-scrollbar \
        -bw 2 \
        -lines 6 \
        -m -3 \
        -theme-str '#window {anchor:south;location:west;x-offset:-280px;y-offset:-160px;width:16.5%;}' \
        -eh 1 \
        -width -22 \
        -no-custom \
        -p "$blockdate" > /dev/null
