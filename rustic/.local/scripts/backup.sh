#!/bin/bash

set -e

readonly BACKUP_LOG="/tmp/backup.log"
readonly PING_KEY="$HOME/.config/rustic/ping-key"

log() {
    local timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    printf "%s %s\n" "$timestamp" "$1" >>"$BACKUP_LOG"
}

clear_backup_log() {
    echo "" >"$BACKUP_LOG"
}

wait_for_network() {
    while ! nm-online -t 900; do
        log "Waiting for network connection..."
    done
}

load_ping_url() {
    # Check if the key file exists
    if [[ ! -f "$PING_KEY" ]]; then
        log "Error: Missing key file at $PING_KEY"
        exit 1
    fi

    # Read the ping key from the file
    local ping_key
    ping_key=$(<"$PING_KEY")

    # Check if the ping key is empty
    if [[ -z "$ping_key" ]]; then
        log "Error: Ping key is empty"
        exit 1
    fi

    # Define the URL for the healthchecks.io ping
    PING_URL="https://hc-ping.com/${ping_key}/laptop-backup"
}

send_ping() {
    log "Sending ping to healthchecks.io ($PING_URL/$1)"

    local result
    result=$(curl -fsS -m 10 --retry 5 --data-raw "$2" "$PING_URL/$1")

    log "Result: $result"

    if [[ "$result" != "OK" ]]; then
        log "Error: Failed to send ping to healthchecks.io"
        exit 1
    fi
}

perform_backup() {
    # Ping to track the duration
    send_ping "start"

    log "Starting backup"

    local backup_output backup_code forget_output forget_code data_raw

    # Execute backup and capture output
    backup_output=$(rustic backup 2>&1)
    backup_code=$?

    # Execute forget and capture output
    forget_output=$(rustic forget 2>&1)
    forget_code=$?

    log "$(printf "Rustic Backup:\n%s" "$backup_output")"
    log "$(printf "Rustic Forget:\n%s" "$forget_output")"

    data_raw=$(printf "%s\n%s\n\n%s\n%s\n" \
        "$ rustic backup" "$backup_output" \
        "$ rustic forget" "$forget_output")

    if [[ "$backup_code" -eq 0 && "$forget_code" -eq 0 ]]; then
        local data_raw_uncolor
        data_raw_uncolor=$(echo "$data_raw" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g')

        send_ping "0" "$data_raw_uncolor"
        notify-send "Backup Successful" "$data_raw_uncolor" --icon=gtk-ok --app-name="Rustic"
    else
        send_ping "fail"
        notify-send "Backup Error" "An error occurred during the backup process. See $BACKUP_LOG for details" --icon=gtk-no --app-name="Rustic"
    fi
}

main() {
    clear_backup_log
    wait_for_network
    load_ping_url
    perform_backup
    ./check-mega.sh
}

main "$@"
