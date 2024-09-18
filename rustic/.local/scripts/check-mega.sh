#!/bin/sh

# Check if the MEGA storage is full

MEGA_INFO=$(rclone about mega-backups: --json)

MEGA_USED=$(echo "$MEGA_INFO" | jq -r '.used')
MEGA_TOTAL=$(echo "$MEGA_INFO" | jq -r '.total')

if [ "$MEGA_USED" -gt "$MEGA_TOTAL" ]; then
    MEGA_USED_READABLE=$(numfmt --to=iec-i --suffix=B --format="%.2f" "$MEGA_USED")

    notify-send "Backup Error" "The MEGA storage is full at $MEGA_USED_READABLE" --icon=gtk-no --app-name="Rustic"
    exit 1
fi
