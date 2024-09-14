# Rustic Setup

The folder `.config/rustic` contains the configuration files for [Rustic](https://github.com/rustic-rs/rustic) backups with MEGA cloud storage.

- `rustic.toml` Rustic configuration file
- `excludes.txt`: Lists files and folders to exclude from backups (glob patterns)
- `rustic-key` Contains the password for the MEGA repository
- `healthchecks.conf` Contains the ping key for healthchecks.io (PING_KEY=\<your-key-here\>)

The script `backup.sh` makes a backup, sends the backup report to healthchecks.io, and sends a notification of the result.
The script is executed by anacron every 3 days with a delay of 5 minutes.
