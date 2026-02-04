#!/bin/bash

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                        background.color=$SURFACE1\
                        label.color=$WHITE   \
                        icon.color=$WHITE    \
           --subscribe volume volume_change 
