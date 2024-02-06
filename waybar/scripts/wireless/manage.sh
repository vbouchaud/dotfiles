#!/usr/bin/env sh

iconstore="/usr/share/icons/HighContrast/256x256/status"

select_network() {
    {
        echo "new connection"
        find /etc/netctl -maxdepth 1 -mindepth 1 -type f -exec basename {} \;
    } | wofi --width=10% --show=dmenu --prompt="${1}"
}

if ip route | grep wlp0s20f3; then
    network="$(netctl list | grep '*' | cut -d' ' -f2 )"

    sudo netctl stop "${network}"

    icon="${iconstore}/network-wireless-offline.png"
    if [[ "${network}" =~ "ethernet" ]]; then
        icon="${iconstore}/network-wired-disconnected.png"
    fi

    notify-send -i "${icon}" -t 5000 "$network" "disconnecting..."
else
    network="$(select_network "connect...")"

    if [[ "${network}" = "new connection" ]]; then
        footclient --title "wifi-menu" sudo wifi-menu
    else
        sudo netctl start "${network}"
    fi

    icon="${iconstore}/network-wireless-acquiring.png"
    if [[ "${network}" =~ "ethernet" ]]; then
        icon="${iconstore}/network-wired-acquiring.png"
    fi

    notify-send -i "${icon}" -t 5000 "$network" "connecting..."
fi
