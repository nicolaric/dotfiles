#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
                      icon=􀧓  \
                      background.color=$SURFACE1 \
                      label.color="$WHITE" \
                      icon.color="$WHITE" \
                      script="$PLUGIN_DIR/cpu.sh"
