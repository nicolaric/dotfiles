#!/bin/bash

source "$CONFIG_DIR/plugins/icon_map.sh"

SPACE_SIDS=(1 2 3 4 5 6 7)
for sid in "${SPACE_SIDS[@]}"; do
  apps=$(aerospace list-windows --workspace $sid --json | jq -r '.[]."app-name"')

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      __icon_map "${app}"
      icon_strip+=" ${icon_result}"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  sketchybar --set space.$sid label="$icon_strip"
done
