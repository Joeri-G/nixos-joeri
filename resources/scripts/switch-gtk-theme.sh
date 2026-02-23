#!/usr/bin/env bash
if [[ "$1" != "dark" && "$1" != "light" ]]; then 
    echo "pick light or dark"
    exit 1
fi
echo switching theme...
dconf write "/org/gnome/desktop/interface/gtk-theme" "'Zukitre-$1'"
dconf write "/org/gnome/desktop/interface/color-scheme" "'prefer-$1'"
echo Switched to $1 theme
