#!/bin/bash

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                        background.color=$YELLOW \
           --subscribe volume volume_change 
