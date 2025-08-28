#!/bin/bash

# Script to replace various strings in genesis_inspector.rs

# Define the file to modify
FILE="../crates/sui/src/genesis_inspector.rs"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File $FILE does not exist"
    exit 1
fi

# Apply replacements
gsed -i \
    -e 's/STR_SUI: &str = "Sui"/STR_SUI: \&str = "OCT"/g' \
    -e 's/STR_STAKED_SUI: &str = "StakedSui"/STR_STAKED_SUI: \&str = "StakedOct"/g' \
    -e 's/STR_SUI_DISTRIBUTION: &str = "Sui Distribution"/STR_SUI_DISTRIBUTION: \&str = "OCT Distribution"/g' \
    -e 's/pub(crate) fn examine_genesis_checkpoint/pub fn examine_genesis_checkpoint/g' \
    "$FILE"

echo "Replacements completed in $FILE"