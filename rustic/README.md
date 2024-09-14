# Rustic Setup

Setup for Rustic backups with MEGA cloud storage.

## Requirements

- [Rclone](https://rclone.org/)
- [Rustic](https://github.com/rustic-rs/rustic)
- MEGA account
- [Healthchecks.io](https://healthchecks.io/) account (optional)
- Anacron (optional)

## Configuration

- `rustic.toml` Rustic configuration file
- `rustic-key` Contains the password for the MEGA repository
- `ping-key` Contains the ping key for the healthchecks.io
- `excludes.txt`: Lists files and folders to exclude from backups (glob patterns)

Ensure that the key files have `600` permissions to secure their contents.

## Scripts

- `backup.sh` Executes the backup, pings healthchecks.io, and sends a notification of the result.
- `check-mega.sh` Checks if the MEGA storage exceeds the limit and sends a notification if it does.

## Scheduling

The scripts are configured to run every 3 days using Anacron.
If Anacron is not available, you can manually run the scripts as needed.
