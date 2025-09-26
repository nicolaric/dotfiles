#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

# Get the currently focused workspace
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused | awk '{print $1}')

# $1 is the workspace ID passed to the script (from your main config)
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on \
                     background.color="$PINK" \
                     label.color="$BLACK" \
                     icon.color="$BLACK"
else
    sketchybar --set "$NAME" background.drawing=on \
                     background.color="$SKY" \
                     label.color="$BLACK" \
                     icon.color="$BLACK"
fi
