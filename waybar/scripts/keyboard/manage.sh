#!/usr/bin/env sh

us_intl="English (US, intl., with dead keys)"
fr_ergol="French (Ergo‑L)"

input="$(swaymsg -t get_inputs -r | jq -r '. | map(select(.type == "keyboard" and .vendor == 12972)) | .[0].xkb_active_layout_name')"

if [ "${input}" == "${us_intl}" ]; then
    swaymsg input "type:keyboard" xkb_switch_layout next
elif [ "${input}" == "${fr_ergol}" ]; then
    swaymsg input "type:keyboard" xkb_switch_layout prev
else
    swaymsg input "type:keyboard" xkb_switch_layout "0"
fi
