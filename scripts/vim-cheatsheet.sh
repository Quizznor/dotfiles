#!/usr/bin/env bash

exit_script () {
    killall conky
    notify-send "goodbye"
    exit
}

reload_conky () {
    if [[ ! $1 -eq $2 ]]; then 
        killall conky
        notify-send "loading vim-$2.conf"
        conky -c $HOME/.config/conky/vim-$2.conf &
    fi
}

counter=1
conky -c $HOME/.config/conky/vim-$counter.conf &
gawk_opts='/RawKeyRelease/ {getline; getline; getline; print $2; fflush()}'
xinput test-xi2 --root 3 | gawk "$gawk_opts" | while read -r key; do
    case "$key" in 
        "113")
            old=$counter 
            counter=$(( counter == 1 ? 2 : counter ))
            counter=$(( counter - 1 ))
            reload_conky $old $counter;;
        "114")
            old=$counter 
            counter=$(( counter + 1 ))
            counter=$(( counter > 4 ? 4 : counter ))
            reload_conky $old $counter;;
        *) 
            exit_script ;;
    esac
done