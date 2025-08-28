#!/bin/bash

# Script to replace sui-faucet -> one-faucet in Cargo.toml

# Define the file to modify
FILE="../crates/sui-faucet/Cargo.toml"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File $FILE does not exist"
    exit 1
fi

gsed -i \
    -e 's/sui-faucet/one-faucet/g' \
    "$FILE"

echo "Replacements completed in $FILE"