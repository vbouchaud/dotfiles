#!/usr/bin/env sh

cat <<EOF | wofi --width=10% --lines=5 --show dmenu -p "power..." | xargs swaymsg exec --
poweroff
reboot
EOF
