#!/bin/bash

wget -O /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
dpkg -i /tmp/vscode.deb
rm /tmp/vscode.deb

mkdir -p ~/.config/Code/User
cp ../software/vscode/settings.json ~/.config/Code/User/settings.json