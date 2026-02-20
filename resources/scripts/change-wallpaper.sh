#!/bin/usr/env bash

$COLOR=$(darkman get)
# Generate a color pallette
if [ "$COLOR" = "dark" ]; then
    wal -i "$1" --cols16 lighten -n
    break
else
    wal -i "$1" --cols16 darken -n -l
    break
fi
swww img --transition-fps 144 --transition-type grow --transition-duration 2 --invert-y --transition-pos 0,0 "$1"