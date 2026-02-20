#!/usr/bin/env bash
# Disables the internal display when a closed lid is detected on startup.
if [ "$(awk '{print $2}' /proc/acpi/button/lid/LID0/state)" = "closed" ]; then
    # Disabling a monitor whilst waybar and other applications are starting / switching might crash them.
    # Ideally we would disable the monitor before the applications switch over, but I have not yet
    # figured out how to do so.
    sleep 3
    hyprctl keyword monitor "eDP-1, disable"
fi
