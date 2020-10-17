#!/usr/bin/env bash

xev -geometry 10x10 | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
