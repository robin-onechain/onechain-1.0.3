#!/bin/bash

# Script to replace sui -> oct and SUI -> OCT in gas_coin.rs

# Define the file to modify
FILE="../crates/sui-types/src/gas_coin.rs"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File $FILE does not exist"
    exit 1
fi

gsed -i \
    -e 's/\bSUI\b/OCT/g' \
    -e 's/\bsui\b/oct/g' \
    "$FILE"

echo "Replacements completed in $FILE"
