#!/usr/bin/env bash

checkupdates+aur | awk '{print $1}' > $HOME/system/.updates