#!/bin/bash

mkdir /tmp/dashtopanel
cd /tmp/dashtopanel

wget -O dashtopanel.zip https://extensions.gnome.org/extension-data/dash-to-paneljderose9.github.com.v19.shell-extension.zip
unzip dashtopanel.zip
rm dashtopanel.zip
cd /tmp

ID=$(cat dashtopanel/metadata.json | grep uuid | sed 's/  "uuid": "\(.*\)",/\1/')
if [[ $ID == *"uuid"* ]]; then
    echo 'Failed to get UUID'
    exit 1
fi

mkdir -p ~/.local/share/gnome-shell/extensions/
mv dashtopanel/ ~/.local/share/gnome-shell/extensions/$ID

gnome-shell --replace &
disown

dconf write /org/gnome/shell/enabled-extensions "['dash-to-panel@jderose9.github.com']"
dconf write /org/gnome/shell/extensions/dash-to-panel/location-clock "'STATUSRIGHT'"
dconf write /org/gnome/shell/extensions/dash-to-panel/show-window-previews false
dconf write /org/gnome/shell/extensions/dash-to-panel/group-apps false
dconf write /org/gnome/shell/extensions/dash-to-panel/panel-size 32
dconf write /org/gnome/shell/extensions/dash-to-panel/appicon-margin 4
