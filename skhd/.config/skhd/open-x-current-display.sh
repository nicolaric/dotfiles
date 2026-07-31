#!/usr/bin/env bash
set -euo pipefail

app="Zen Browser"
url="https://x.com"

# Remember the currently focused display before opening Zen.
display="$(yabai -m query --displays --display | jq -r '.index')"

open -a "$app" "$url"

# Give macOS/yabai a moment to focus the Zen window that received the URL.
for _ in {1..20}; do
  focused_app="$(yabai -m query --windows --window 2>/dev/null | jq -r '.app // empty' || true)"
  [[ "$focused_app" == "$app" || "$focused_app" == "Zen" ]] && break
  sleep 0.1
done

# Put Zen on the display that was focused when the hotkey was pressed.
yabai -m window --display "$display" 2>/dev/null || true
yabai -m display --focus "$display" 2>/dev/null || true
