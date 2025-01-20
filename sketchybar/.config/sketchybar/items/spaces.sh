#!/bin/bash
sketchybar --add event aerospace_workspace_change

SPACE_SIDS=(1 2 3 4 5)

for sid in "${SPACE_SIDS[@]}"; do
        sketchybar --add item space.$sid left                   \
            --subscribe space.$sid aerospace_workspace_change   \
            --set space.$sid                                    \
                  background.corner_radius=5                    \
                  background.drawing=on                         \
                  background.height=20                          \
                  label.font="sketchybar-app-font:Regular:16.0" \
                  label.padding_right=20                        \
                  label.y_offset=-1                             \
                  icon=$sid                                     \
                  click_script="aerospace workspace $sid"       \
                  script="$CONFIG_DIR/plugins/aerospace.sh $sid"

done

sketchybar --add item space_separator left                             \
           --set space_separator icon.color=$SKY \
                         icon.padding_left=4                   \
                         label.drawing=off                     \
                         background.drawing=off                \
                         script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator aerospace_workspace_change    
