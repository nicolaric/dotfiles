#!/bin/bash


SPACE_SIDS=(1 2 3 4 5)
for sid in "${SPACE_SIDS[@]}"; do
  apps=$(aerospace list-windows --workspace $sid --json | jq -r '.[]."app-name"')

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  sketchybar --set space.$sid label="$icon_strip"
done
