#!/bin/bash

# Script to replace SUI -> OCT in multiple files

# Define the files to modify
FILES=(
    "../crates/sui-core/src/authority/authority_store.rs"
    "../sui-execution/latest/sui-adapter/src/temporary_store.rs"
    "../sui-execution/v0/sui-adapter/src/temporary_store.rs"
    "../sui-execution/v1/sui-adapter/src/temporary_store.rs"
    "../sui-execution/v2/sui-adapter/src/temporary_store.rs"
)

# Process each file
for FILE in "${FILES[@]}"; do
    if [ ! -f "$FILE" ]; then
        echo "Warning: File $FILE does not exist, skipping..."
        continue
    fi

    echo "Processing $FILE..."

    # Replace SUI with OCT
    gsed -i \
        -e 's/\bSUI\b/OCT/g' \
        "$FILE"

    echo "Completed replacements in $FILE"
done

echo "All SUI -> OCT replacements completed"