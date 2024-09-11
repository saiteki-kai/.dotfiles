#!/bin/sh

# check if the MEGA storage is full

MEGA_LIMIT=20000000000 # 20 GB
MEGA_SIZE=$(rclone size mega-backups: --json | jq -r '.bytes')

# rustic repoinfo --json | jq -r '.[] | select(.repo) | .repo | map(.size) | add'

if [ "$MEGA_SIZE" -gt "$MEGA_LIMIT" ]; then
    MEGA_SIZE_READABLE=$(numfmt --to=iec-i --suffix=B --format="%.2f" "$MEGA_SIZE")

    notify-send "Backup Error" "The MEGA storage is full at $MEGA_SIZE_READABLE" --icon=gtk-no --app-name="Rustic"
fi
