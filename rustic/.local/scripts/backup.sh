#!/bin/bash

set -e

readonly BACKUP_LOG="/tmp/backup.log"
readonly PING_KEY="$HOME/.config/rustic/ping-key"

log() {
    local timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    printf "[%s] %s\n" "$timestamp" "$1" >>"$BACKUP_LOG"
    printf "[%s] %s\n" "$timestamp" "$1"
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

    local start_time=$(date +%s)

    # Trap to remove temporary files on exit
    trap 'rm -f "$BACKUP_OUTPUT_TMP" "$FORGET_OUTPUT_TMP" "$PRUNE_OUTPUT_TMP"' EXIT

    # Create temporary files
    readonly BACKUP_OUTPUT_TMP=$(mktemp)
    readonly FORGET_OUTPUT_TMP=$(mktemp)
    readonly PRUNE_OUTPUT_TMP=$(mktemp)

    # Execute backup and capture output
    log "Rustic Backup:"
    rustic backup 2>&1 | tee -a "$BACKUP_LOG" "$BACKUP_OUTPUT_TMP"
    local backup_code=${PIPESTATUS[0]}

    # Execute forget and capture output
    log "Rustic Forget:"
    rustic forget 2>&1 | tee -a "$BACKUP_LOG" "$FORGET_OUTPUT_TMP"
    local forget_code=${PIPESTATUS[0]}

    # Execute prune and capture output
    log "Rustic Prune:"
    rustic prune --max-repack=0 2>&1 | tee -a "$BACKUP_LOG" "$PRUNE_OUTPUT_TMP"
    local prune_code=${PIPESTATUS[0]}

    local end_time=$(date +%s)
    local duration=$((end_time - start_time))

    local notification_body="Took $(($duration / 60)) minutes and $(($duration % 60)) seconds."

    if [[ "$backup_code" -eq 0 ]]; then
        local data_raw_uncolor
        data_raw_uncolor=$(cat "$BACKUP_LOG" | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g')

        send_ping "0" "$data_raw_uncolor"
        notify-send "Backup Successful" "$notification_body" --icon=gtk-ok --app-name="Rustic"

        if [[ "$forget_code" -ne 0 ]]; then
            log "Error: Rustic forget operation failed."
            notify-send "Backup Error" "Rustic forget operation failed." --icon=gtk-warning --app-name="Rustic"
        fi

        if [[ "$prune_code" -ne 0 ]]; then
            log "Error: Rustic prune operation failed."
            notify-send "Backup Error" "Rustic prune operation failed." --icon=gtk-warning --app-name="Rustic"
        fi

    else
        send_ping "fail"
        notify-send "Backup Error" "An error occurred during the backup process. See $BACKUP_LOG for details" --icon=gtk-no --app-name="Rustic"
    fi
}

check_mega() {
    ~/.local/scripts/check-mega.sh
}

main() {
    check_mega
    clear_backup_log
    wait_for_network
    load_ping_url
    perform_backup
}

main "$@"
