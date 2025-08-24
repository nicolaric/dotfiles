#!/bin/bash
sketchybar --add event aerospace_workspace_change

for m in $(aerospace list-monitors | awk '{print $1}')
do
    for i in $(aerospace list-workspaces --monitor $m)
    do
        if [ "$i" -gt 7 ]; then
            continue
        fi
        if [ "$m" -eq 0 && "$i" -gt 5 ]; then
            continue
        fi
        sid=$i
        sketchybar --add item space.$sid left                   \
            --subscribe space.$sid aerospace_workspace_change        \
            --set space.$sid                                    \
                  background.corner_radius=5                    \
                  background.drawing=on                         \
                  background.height=20                          \
                  label.font="sketchybar-app-font:Regular:16.0" \
                  label.padding_right=20                        \
                  label.y_offset=-1                             \
                  icon=$sid                                     \
                  display=$m                                    \
                  click_script="aerospace workspace $i"         \
                  debug script="$CONFIG_DIR/plugins/aerospace.sh $i"
    done
done

sketchybar --add item space_separator left                             \
           --set space_separator icon.color=$SKY \
                        icon.padding_left=4                   \
                        label.drawing=off                     \
                         background.drawing=off                \
                         script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator aerospace_workspace_change    
