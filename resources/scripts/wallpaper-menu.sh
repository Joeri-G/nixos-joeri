#!/usr/bin/env bash
while true; do
    # List files in the wallpaper directory and send them to wofi
    SELECTED=$(ls "$1"/*.{png,jpg,jpeg,gif,webp} 2>/dev/null | xargs -n 1 basename |  rofi -dmenu -p "" -theme-str '#window { width: 300px; }' -window-title "Select a wallpaper")

    # Check if a selection was made
    if [ -n "$SELECTED" ]; then
        wallpaper-select "$1/$SELECTED"
        break
    else
        # Exit the loop if no selection is made (e.g., user closes wofi or presses ESC)
        break
    fi
done
