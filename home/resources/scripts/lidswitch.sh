#!/usr/bin/env bash
# Disables the internal display when a closed lid is detected on startup.
if [ "$(awk '{print $2}' /proc/acpi/button/lid/LID0/state)" = "closed" ]; then
    hyprctl keyword monitor "eDP-1, disable"
fi
