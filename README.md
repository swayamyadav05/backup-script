# Backup Project

This project provides a backup solution using shell scripts to archive files that have been modified within the last 24 hours. 

## Project Structure

- `backups/`: Stores backup archives created by the scripts.
- `scripts/`: Contains shell scripts for creating and managing backups.
- `docs/`: Holds important documents, both zipped and unzipped versions.
- `README.md`: Provides project overview and usage instructions.
- `.gitignore`: Defines files and folders to be ignored by Git.

## Usage

To create a backup, run the following command from the `scripts` directory:

```bash
./backup.sh <target_directory> <destination_directory>
