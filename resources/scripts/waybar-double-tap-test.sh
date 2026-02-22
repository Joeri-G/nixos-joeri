#!/usr/bin/env bash

TAP_FLAG="/tmp/waybar-double-tap-flag"

if [ -e "$TAP_FLAG" ]; then
    rm "$TAP_FLAG"
    pkill --signal SIGUSR1 waybar
    exit 0
else 
    # Create the flag file and set a timeout
    touch "$TAP_FLAG"
    sleep 1

    # Remove the flag file after the timeout
    rm -f "$TAP_FLAG"
fi
