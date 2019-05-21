#!/bin/bash

dconf write /org/gnome/desktop/wm/keybindings/cycle-windows ['<Alt>Tab']
dconf write /org/gnome/desktop/wm/keybindings/cycle-windows-backward ['<Shift><Alt>Tab']
dconf write /org/gnome/desktop/wm/keybindings/switch-applications @as []
dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward @as []