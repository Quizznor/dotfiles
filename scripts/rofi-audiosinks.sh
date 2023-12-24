#!/usr/bin/env bash

# this script only handles ONE device !! 
# add bluetooth devices via bluetoothctl
# (bluetoothctl power on)
# (bluetoothctl agent on)
# (bluetoothctl scan on)
# bluetoothctl pair MAC_ADDRESS
# bluetoothctl trust MAC_ADDRESS
# bluetoothctl connect MAC_ADDRESS

connect_bluetooth () {

    # Attempt to connect to the headset. Timeout after 7 seconds (~6-7 retries)
    HEADPHONE_ADDRESS="F0:AE:66:75:7C:97"
    RUNTIME=$(( $SECONDS + 5 ))

    while [[ -z "$(pactl list sinks | awk '/bluez/{print}')" && $SECONDS -lt $RUNTIME ]]; do
        echo -e "power on\nagent on" | bluetoothctl
        echo -e "connect $HEADPHONE_ADDRESS" | bluetoothctl
        sleep 1
    done

    if [ -z "$(pactl list sinks | awk '/bluez_output/{print}')" ]; then
        notify-send "Connection refused =(" "Failed to pair with device"
    else 
        notify-send "Connection established =)" "Your device is paired. Enjoy!"
    fi    
}

disconnect_bluetooth () {
    bluetoothctl power off
    notify-send "TODO" "Implement other sound sinks"
}

PROMPT="  \n  \n  "
SELECTED=$(echo -en "${PROMPT[@]}" | rofi -dmenu -theme $HOME/.config/rofi/audiosinks.rasi)

case $SELECTED in
    *""*) connect_bluetooth ;;
    *) disconnect_bluetooth ;;
esac