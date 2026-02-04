#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         script="$PLUGIN_DIR/battery.sh" \
                         background.color=$SURFACE1 \
                         label.color="$WHITE" \
                         icon.color="$WHITE" \
           --subscribe battery system_woke power_source_change
