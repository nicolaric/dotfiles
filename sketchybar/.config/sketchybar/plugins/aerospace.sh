#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused | awk '{print $1}')

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME \
                     background.color=$PINK 

else
    sketchybar --set $NAME \
                     background.color=$SKY 
fi
