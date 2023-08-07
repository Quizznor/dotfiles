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
    echo "Electron was updated... hiding electron desktop file"
    sudo mv /usr/share/applications/electron*.desktop /usr/share/applications/.electron.desktop
fi

if [[ "$packages" == *"plasma"* ]]; then
    echo "KDE/Plasma was updated... hiding bloatware"
    sudo rm -rf /usr/share/applications/org.kde.plasma.emojier.desktop
    sudo rm -rf /usr/share/applications/org.kde.plasma.themeexplorer.desktop
    sudo rm -rf /usr/share/applications/org.kde.plasma.lookandfeelexplorer.desktop
    sudo rm -rf /usr/share/applications/org.kde.kmenuedit.desktop