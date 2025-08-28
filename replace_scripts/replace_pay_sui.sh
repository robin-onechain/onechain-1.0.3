#!/bin/bash

# Script to rename pay_sui.rs to pay_oct.rs

# Define the source and target files
SOURCE_FILE="../crates/sui-rpc-loadgen/src/payload/pay_sui.rs"
TARGET_FILE="../crates/sui-rpc-loadgen/src/payload/pay_oct.rs"

# Check if the source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: File $SOURCE_FILE does not exist"
    exit 1
fi

# Rename the file
mv "$SOURCE_FILE" "$TARGET_FILE"

echo "Renamed $SOURCE_FILE to $TARGET_FILE"