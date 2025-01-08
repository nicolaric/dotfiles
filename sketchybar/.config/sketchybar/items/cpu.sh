#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
                      icon=􀧓  \
                      background.color=$LAVENDER \
                      script="$PLUGIN_DIR/cpu.sh"
