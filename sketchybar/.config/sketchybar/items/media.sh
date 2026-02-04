#!/bin/bash

sketchybar --add item media e \
           --set media label.color=$SURFACE1 \
                       label.max_chars=20 \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       icon=􀑪             \
                       icon.color=$SURFACE1   \
                       label.color=$WHITE   \
                       icon.color=$WHITE   \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
