#!/bin/bash

# Wait for connection
while ! nm-online -t 900; do
    echo "Waiting for network connection..."
done

# Load healthchecks.io config
CONFIG_FILE="$HOME/.config/rustic/healthchecks.conf"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Config file not found: $CONFIG_FILE"
    exit 1
fi

. "$CONFIG_FILE"

if [ -z "$PING_KEY" ]; then
    echo "No PING_KEY found in $CONFIG_FILE"
    exit 1
fi

PING_URL="https://hc-ping.com/$PING_KEY/laptop-backup"

send_ping() {
    curl -fsS -m 10 --retry 5 -o /dev/null --data-raw "$2" "$PING_URL/$1"
}

# Ping to track the duration
send_ping "start"

# Execute backup and capture output
BACKUP_OUTPUT=$(rustic backup 2>&1)
BACKUP_CODE=$?

# Execute forget and capture output
FORGET_OUTPUT=$(rustic forget 2>&1)
FORGET_CODE=$?

DATA_RAW=$(printf "%s\n%s\n\n%s\n%s\n" \
    "$ rustic backup" "$BACKUP_OUTPUT" \
    "$ rustic forget" "$FORGET_OUTPUT")

BACKUP_LOG="/tmp/backup.log"

if [[ $BACKUP_CODE -eq 0 && $FORGET_CODE -eq 0 ]]; then
    DATA_RAW_UNCOLOR=$(echo "$DATA_RAW" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g')

    send_ping "0" "$DATA_RAW_UNCOLOR"
    notify-send "Backup Successful" "$DATA_RAW_UNCOLOR" --icon=gtk-ok --app-name="Rustic"
else
    send_ping "fail"
    notify-send "Backup Error" "An error occurred during the backup process. See $BACKUP_LOG for details" --icon=gtk-no --app-name="Rustic"
fi

# Write the backup output to a file
echo "$DATA_RAW" >$BACKUP_LOG

# Check if the MEGA storage is full
./check-mega.sh
