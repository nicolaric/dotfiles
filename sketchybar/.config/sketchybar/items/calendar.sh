#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
                          update_freq=30 \
                          script="$PLUGIN_DIR/calendar.sh" \
                          background.color=$SURFACE1 \
                          icon.color="$WHITE" \
                          label.color="$WHITE" 


