#!/bin/usr/env bash

darkman_value=$(darkman get)
# Use the value from $2 if it is provided, otherwise use darkman_value
theme_state="${2:-$darkman_value}"

if [[ "$theme_state" == "dark" ]]; then
    wal -i "$1" --cols16 lighten -n
elif [[ "$theme_state" == "light" ]]; then
    wal -i "$1" --cols16 darken -n -l
else
    echo "Unexpected value: $theme_state"
    exit
fi

hyprctl reload config-only # load new theme

swww img --transition-fps 144 --transition-type grow --transition-duration 2 --invert-y --transition-pos 0,0 "$1"
