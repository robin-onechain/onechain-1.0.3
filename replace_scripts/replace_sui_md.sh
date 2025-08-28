#!/bin/bash

# Script to rename sui.md to oct.md and replace sui -> oct inside the file

# Define the source and target files
SOURCE_FILE="../crates/sui-framework/docs/sui/sui.md"
TARGET_FILE="../crates/sui-framework/docs/sui/oct.md"

# Check if the source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: File $SOURCE_FILE does not exist"
    exit 1
fi

# Replace sui with oct in the file
gsed -i \
    -e 's/\bsui\b/oct/g' \
    -e 's/\bSui\b/Oct/g' \
    -e 's/\bSUI\b/OCT/g' \
    "$SOURCE_FILE"

# Rename the file
mv "$SOURCE_FILE" "$TARGET_FILE"

echo "Renamed $SOURCE_FILE to $TARGET_FILE"
echo "Replacements completed"