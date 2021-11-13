#!/usr/bin/env bash

# use pavucontrol to change the codec of the headset, if desired

PROMPT=("  \n  \n  \n  \n  ")
HEADPHONE_ADDRESS="98:52:3D:27:D1:02"
SPEAKER_SINK="alsa_output.pci-0000_00_1f.3.analog-stereo"
HEADPHONE_SINK="alsa_output.usb-GeneralPlus_USB_Audio_Device-00.iec958-stereo"
BLUETOOTH_SINK="bluez_sink.98_52_3D_27_D1_02.a2dp_sink"
HDMI_SINK="alsa_output.pci-0000_00_1f.3.hdmi-stereo"

SELECTED=$(echo -en "${PROMPT[@]}" | rofi -dmenu -theme controlprompt -p "Select a sink:" -l 5)

case $SELECTED in

  *""*) # Notebook speakers
  bluetoothctl power off
  pacmd set-default-sink $SPEAKER_SINK    # Whichever of these is currently connected
  ;;

  *""*) # Headphone with cable
  bluetoothctl power off
  pacmd set-default-sink $HEADPHONE_SINK
  ;;
  
  *""*) # Bluetooth headset
  RUNTIME=$((SECONDS+10)) # Attempt to connect to the headset. Timeout after 10 seconds (~9-10 retries)
  while [[ -z "$(pacmd list-sinks | awk '/bluez/{print}')" && $SECONDS -lt $RUNTIME ]]
  do
    echo $SECONDS
    echo -e "power on\nagent on" | bluetoothctl
    echo -e "connect $HEADPHONE_ADDRESS" | bluetoothctl
    sleep 1
  done

  if ! [ -z "$(pacmd list-sinks | awk '/bluez/{print}')" ]; then
    pacmd set-default-sink $BLUETOOTH_SINK
  fi
  ;;

  *""*) # HDMI Audiosink
  bluetoothctl power off
  pacmd set-card-profile 1 output:hdmi-stereo # this might be unstable, specify card more clearly?
  pacmd set-default-sink $HDMI_SINK
  ;;

  *""*) # List all currently active audiosinks
  kitty --config=$HOME/.config/kitty/kitty.conf --title="floatterm" --hold pacmd list-sinks
  ;;
esac
