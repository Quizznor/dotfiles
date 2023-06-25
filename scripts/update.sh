#!/usr/bin/env bash

echo "Getting package list pre update..."
packages=$(echo $(checkupdates+aur | awk '{print $1}'))

yay -Syu

echo "Performing post process transactions..."
if [ "$packages" == *"firefox"* ]; then
    echo "Firefox was updated... overwriting firefox.desktop file"
    sudo mv $HOME/.config/firefox/firefox.desktop /usr/share/applications/
fi

if [ "$packages" == *"code"* ]; then
    echo "Visual Studio Code was updated... linking vscode.desktop file"
    sudo mv $HOME/.config/code/visual-studio-code-insiders.desktop /usr/share/applications
fi