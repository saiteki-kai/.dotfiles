#!/bin/bash
# Fetch healthchecks.io status and output for Waybar

# Check if HEALTHCHECKS_URL environment variable is set, fallback to file
if [ -n "$HEALTHCHECKS_URL" ]; then
    URL="${HEALTHCHECKS_URL}"
else
    echo '{"text": "Error", "alt": "error", "class": "down", "tooltip": "Backup: No URL configured"}'
    exit 1
fi

if response=$(curl -s -m 2 "$URL" 2>/dev/null) && [ -n "$response" ]; then
    status=$(echo "$response" | jq -r '.status')
    if [ "$status" = "up" ]; then
        echo '{"text": "Up", "alt": "up", "class": "up", "tooltip": "Backup: Operational"}'
    elif [ "$status" = "late" ]; then
        echo '{"text": "Late", "alt": "late", "class": "late", "tooltip": "Backup: Overdue"}'
    else
        echo '{"text": "Down", "alt": "down", "class": "down", "tooltip": "Backup: Failed"}'
    fi
else
    echo '{"text": "Down", "alt": "down", "class": "down", "tooltip": "Backup: Connection Error"}'
fi
