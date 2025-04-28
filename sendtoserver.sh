#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <username> <server_address> <file1> [file2 ... fileN]"
    exit 1
fi

# Extract username and server address
USERNAME=$1
SERVER=$2

# Shift the first two arguments to get the list of files
shift 2

# Loop through all the files and send them via scp
for FILE in "$@"; do
    if [ -f "$FILE" ]; then
        echo "Sending $FILE to $USERNAME@$SERVER..."
        scp "$FILE" "$USERNAME@$SERVER:~/"
        if [ $? -eq 0 ]; then
            echo "$FILE successfully sent."
        else
            echo "Failed to send $FILE."
        fi
    else
        echo "File $FILE does not exist. Skipping."
    fi
done