#!/bin/bash
set -euo pipefail

SOURCE_DIR="/mnt/c/Users/Lenovo/Documents/Graded Automatic Backup Systems/source"
BACKUP_DIR="/mnt/c/Users/Lenovo/Documents/Graded Automatic Backup Systems/backups"

# Ensure folders exist
if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "ERROR: SOURCE_DIR does not exist: $SOURCE_DIR"
  exit 1   
fi
mkdir -p "$BACKUP_DIR"

ts=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$ts.tar"

# Create the archive from inside the source directory (safe with spaces)
tar -cf "$BACKUP_FILE" -C "$SOURCE_DIR" .

echo "Backup completed successfully."
echo "Backup saved at: $BACKUP_FILE"
