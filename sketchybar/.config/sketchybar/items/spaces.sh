#!/bin/bash
sketchybar --add event aerospace_workspace_change

# Dynamically map AeroSpace monitor IDs to NSScreen IDs for SketchyBar
declare -A monitor_map
while read -r aerospace_id nsscreen_id name; do
    monitor_map[$aerospace_id]=$nsscreen_id
done < <(aerospace list-monitors --format "%{monitor-id} %{monitor-appkit-nsscreen-screens-id} %{monitor-name}")

for m in "${!monitor_map[@]}"; do  # Loop over AeroSpace monitor IDs
    for i in $(aerospace list-workspaces --monitor $m); do
        if [ "$i" -gt 7 ]; then
            continue
        fi
        if [ "$m" -eq 0 && "$i" -gt 5 ]; then  # Keep your custom condition, though m=0 may not exist—verify your aerospace list-monitors output
            continue
        fi
        sid=$i
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
                  display=${monitor_map[$m]}                    \
                  click_script="aerospace workspace $i"         \
                  script="$CONFIG_DIR/plugins/aerospace.sh $i"  
    done
done

# Your separator remains unchanged
sketchybar --add item space_separator left                    \
           --set space_separator icon.color=$SKY              \
                        icon.padding_left=4                   \
                        label.drawing=off                     \
                        background.drawing=off                \
                        script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator aerospace_workspace_change  
