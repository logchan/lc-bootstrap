#!/bin/bash

wget -O /tmp/sarasa.7z https://github.com/be5invis/Sarasa-Gothic/releases/download/v0.8.1/sarasa-gothic-ttf-0.8.1.7z
cd /tmp
7z e sarasa.7z -osarasa sarasa-mono-j-*.ttf
sudo mkdir /usr/local/share/fonts/sarasa
sudo mv sarasa/*.ttf /usr/local/share/fonts/sarasa
sudo chown -R root:root /usr/local/share/fonts/sarasa
rm -r sarasa sarasa.7z
