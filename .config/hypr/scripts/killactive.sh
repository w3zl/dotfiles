#!/bin/bash

# Define an array of application classes to check
apps=("Steam" "TickTick" "betterbird")

# Get the active window's class
active_window_class=$(hyprctl activewindow -j | jq -r ".class")

# Check if the active window class matches any in the array
for app in "${apps[@]}"; do
    if [ "$active_window_class" = "$app" ]; then
        xdotool getactivewindow windowunmap
        notify-send "$app"
        exit 0
    fi
done

# If no match, kill the active window
hyprctl dispatch killactive ""
