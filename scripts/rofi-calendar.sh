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
    | rofi -dmenu -markup-rows -theme calendar -l 6 -p " $blockdate" > /dev/null
