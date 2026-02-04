#!/bin/bash

TOTAL_MEM=$(sysctl -n hw.memsize | awk '{print $1/1024/1024}')
WIRED_MEM=$(sysctl -n hw.physmem | awk '{print $1/1024/1024}')

MEM_PERCENT=$(echo "$WIRED_MEM $TOTAL_MEM" | awk '{printf "%.0f\n", ($1/$2)*100}')

sketchybar --set $NAME label="$MEM_PERCENT%"