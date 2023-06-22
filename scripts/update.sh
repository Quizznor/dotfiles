#!/usr/bin/env bash

packages=$(echo $(checkupdates+aur | awk '{print $1}'))

yay -Syu


echo "Performing post process transactions..."
if [ "$packages" == *"firefox"* ]; then
    echo "Firefox was updated... overwriting firefox.desktop file"
    sudo mv $HOME/.config/firefox/firefox.desktop /usr/share/applications/
fi