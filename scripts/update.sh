#!/usr/bin/env bash

packages=$(cat $HOME/system/.updates)
yay -Syu

echo "Performing post process transactions..."
if [[ "$packages" == *"firefox"* ]]; then
    echo "Firefox was updated... overwriting firefox.desktop file"
    sudo cp $HOME/.config/firefox/firefox.desktop /usr/share/applications/
    sudo cp $HOME/.config/firefox/firefox /usr/bin/firefox
fi

if [[ "$packages" == *"code"* ]]; then
    echo "Visual Studio Code was updated... linking vscode.desktop file"
    sudo cp $HOME/.config/code/visual-studio-code-insiders.desktop /usr/share/applications
fi

if [[ "$packages" == *"electron"* ]]; then
    sudo mv /usr/share/applications/electron22.desktop /usr/share/applications/.electron22.desktop
fi

# monitor desktop files after updates