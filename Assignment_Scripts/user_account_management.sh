#!/bin/bash

USER_FILE="user_list.txt"         # File containing usernames, one per line
CREDENTIALS_FILE="credentials.txt"  # Output file to save username

# Clear credentials file if it exists
> "$CREDENTIALS_FILE"

while IFS= read -r username; do
    # Skip empty lines
    if [ -z "$username" ]; then
        continue
    fi

    # Generate a random password (12 characters)
    password=$(openssl rand -base64 12)

    # Create the user with the generated password (Linux command)
    useradd -m "$username"
    echo "$username:$password" | chpasswd

    # Save username and password to credentials file
    echo "Username: $username | Password: $password" >> "$CREDENTIALS_FILE"
done < "$USER_FILE"

echo "User creation completed. Credentials saved in $CREDENTIALS_FILE."
