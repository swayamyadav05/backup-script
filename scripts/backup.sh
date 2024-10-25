#!/bin/bash

# backup.sh - A script to back up files modified in the last 24 hours
# Usage: backup.sh target_directory destination_directory

# Check if the correct number of arguments is provided
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 target_directory destination_directory"
    exit 1
fi

# Validate if the provided directories exist
target_dir=$1
destination_dir=$2
if [[ ! -d "$target_dir" ]]; then
    echo "Error: Target directory '$target_dir' does not exist."
    exit 1
fi
if [[ ! -d "$destination_dir" ]]; then
    echo "Error: Destination directory '$destination_dir' does not exist."
    exit 1
fi

# Create backups directory within the destination directory if it doesn't exist
backup_dir="$destination_dir/backups"
mkdir -p "$backup_dir"  # -p flag ensures no error if the directory already exists

# Get the current timestamp for the backup file name
currentTS=$(date +%s)
backupFileName="backup-$currentTS.tar.gz"

# Create the backup using the 'find' command for files modified in the last 24 hours
echo "Creating backup of files modified in the last 24 hours..."
find "$target_dir" -type f -mtime -1 -print0 | tar -czvf "$backupFileName" --null -T -

# Check if tar succeeded
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to create backup."
    exit 1
fi

# Move the backup to the backups directory within the destination
mv "$backupFileName" "$backup_dir"
if [[ $? -eq 0 ]]; then
    echo "Backup completed successfully. Archive saved to: $backup_dir/$backupFileName"
else
    echo "Error: Failed to move backup file to destination."
    exit 1
fi
