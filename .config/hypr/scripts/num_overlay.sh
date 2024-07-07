#!/bin/bash

pkill -f "num_overlay_kill.sh"
eww close text_overlay

eww open text_overlay --arg text="`echo $1 | xargs num_to_kanji`" --screen="`hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .id'`"

$HOME/.config/hypr/scripts/num_overlay_kill.sh &
