#!/bin/bash

sketchybar --add item ram right \
           --set ram  update_freq=2 \
                      icon=󰏖  \
                      background.color=$SURFACE1 \
                      label.color="$WHITE" \
                      icon.color="$WHITE" \
                      script="$PLUGIN_DIR/ram.sh"
