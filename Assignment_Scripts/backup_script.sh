#!/bin/bash

# Step 1: Create backup directory in current directory
mkdir -p ./backup

# Step 2: Get current date and time
timestamp=$(date +"%Y%m%d_%H%M%S")

# Step 3: Loop through all .txt files in the current directory
for file in *.txt; do
  # Skip if no .txt file found
  [ -e "$file" ] || continue

  # Remove extension from filename
  filename=$(basename "$file" .txt)

  # New filename with timestamp
  new_filename="${filename}_${timestamp}.txt"

  # Copy file with new name
  cp "$file" ./backup/"$new_filename"
done

echo "Backup completed!"
