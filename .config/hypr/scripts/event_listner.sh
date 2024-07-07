#!/bin/sh

handle() {
  EVENT=$1
  EVENT_NAME=$(echo $EVENT | awk -F '>>' '{print $1}')
  EVENT_VAR=$(echo $EVENT | awk -F '>>' '{print $2}')
  IFS=',' read -r -a EVENT_VARS <<< "$EVENT_VAR"

  case $EVENT_NAME in
    workspace) $HOME/.config/hypr/scripts/num_overlay.sh "$EVENT_VAR";;
    focusedmon) $HOME/.config/hypr/scripts/num_overlay.sh "${EVENT_VARS[1]}"
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
