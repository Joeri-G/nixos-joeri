#!/usr/bin/env bash

# darkman_value=$(darkman get)
darkman_value=dark
if [ -z "$1" ] || [ "$1" != "auto" ]; then
    theme_state="${1:-$darkman_value}"
else
    theme_state="$darkman_value"
fi

rofi -config ~/.cache/wal/colors-rofi-$theme_state.rasi "${@:2}"
