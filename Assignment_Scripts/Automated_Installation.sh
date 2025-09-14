#!/bin/bash

PACKAGE_FILE="packages.txt"
LOG_FILE="./install_log.txt"

# Ensure log file is empty at start
> "$LOG_FILE"

# Update package lists firstclear
sudo apt update

while IFS= read -r package || [[ -n "$package" ]]; do
    if [ -z "$package" ]; then
        continue
    fi

    echo "Installing $package..."
    if sudo apt install -y "$package" &>> "$LOG_FILE"; then
    echo "$(date): $package installed successfully." >> "$LOG_FILE"
    else
    echo "$(date): Failed to install $package. Check above errors." >> "$LOG_FILE"
fi

done < "$PACKAGE_FILE"

echo "Installation process completed. Check $LOG_FILE for details."
