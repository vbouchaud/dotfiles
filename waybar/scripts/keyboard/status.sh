#!/usr/bin/env sh

# 12972 is the vendor of my main keyboard
input="$(swaymsg -t get_inputs -r | jq -r '. | map(select(.type == "keyboard" and .vendor == 12972)) | .[0].xkb_active_layout_name')"

echo "{\"text\": \"${input}\"}"
