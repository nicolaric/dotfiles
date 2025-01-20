#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME \
                     background.color=$PINK 

else
    sketchybar --set $NAME \
                     background.color=$SKY 
fi
