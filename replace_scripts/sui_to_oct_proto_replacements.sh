#!/bin/bash

# Script to replace SUI -> OCT in .proto files (excluding target and replace_scripts)
# Uses find + gsed for global replacements

echo "Starting SUI -> OCT replacements in .proto files..."

# Function to perform replacement on .proto files
perform_replacements() {
    echo "Processing .proto files..."

    # Find all .proto files excluding target and replace_scripts directories
    find .. -name "*.proto" -type f \
        -not -path "../target/*" \
        -not -path "../replace_scripts/*" \
        -exec gsed -i \
            -e 's/SUI/OCT/g' \
            -e 's/sui/oct/g' \
            -e 's/Sui/Oct/g' \
        {} +

    if [ $? -eq 0 ]; then
        echo "✅ Successfully completed .proto file replacements!"
    else
        echo "❌ Some replacements may have failed."
        exit 1
    fi
}

perform_replacements