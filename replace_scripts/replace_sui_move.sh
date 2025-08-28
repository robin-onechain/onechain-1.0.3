#!/bin/bash

# Script to rename sui.move to oct.move and replace sui -> oct inside the file

# Define the source and target files
SOURCE_FILE="../crates/sui-framework/packages/sui-framework/sources/sui.move"
TARGET_FILE="../crates/sui-framework/packages/sui-framework/sources/oct.move"

# Replace sui with oct in the renamed file
gsed -i \
  -e 's/\bsui\b/oct/g' \
  -e 's/\bSui\b/Oct/g' \
  -e 's/\bSUI\b/OCT/g' \
  "$SOURCE_FILE"

# Check if the source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: File $SOURCE_FILE does not exist"
    exit 1
fi

# Rename the file
mv "$SOURCE_FILE" "$TARGET_FILE"
echo "Renamed $SOURCE_FILE to $TARGET_FILE"

echo "Replacements completed in $TARGET_FILE"