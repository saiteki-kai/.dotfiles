#!/bin/bash
# Install dotfiles using stow for a specific window manager.
# Window managers are mutually exclusive as same config files may be used (e.g. waybar, rofi, etc.)
#
# Usage: ./install.sh <wm>

AVAILABLE_WMS=("hyprland" "sway")

WM=$1

# check if wm is available
# shellcheck disable=SC2076
if  [[ ! " ${AVAILABLE_WMS[*]} " =~ " ${WM} " ]]; then
    echo "Usage: $0 <wm>"
    echo "Available window managers: ${AVAILABLE_WMS[*]}"
    exit 1
fi

for folder in */; do
    # skip every WM except the one passed as argument
    for wm in "${AVAILABLE_WMS[@]}"; do
        if [[ "$folder" == "$wm/" && "$wm" != "$WM" ]]; then
            echo "[unstow ${folder//\//}]"
            stow -t "$HOME" -D "$folder"
            printf "\n"
            continue 2
        fi
    done

    echo "[stow ${folder//\//}]"

    stow -t "$HOME" -D "$folder"
    stow -t "$HOME" -v "$folder"

    printf "\n"
done
