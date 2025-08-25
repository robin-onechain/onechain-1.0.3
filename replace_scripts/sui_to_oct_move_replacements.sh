#!/bin/bash

# Script to replace SUI -> OCT in .move files (excluding target and replace_scripts)
# Uses find + gsed for global replacements

echo "Starting SUI -> OCT replacements in .move files..."

# Function to perform replacement on .move files
perform_replacements() {
    echo "Processing .move files..."

    # Find all .move files excluding target and replace_scripts directories
    find .. -name "*.move" -type f \
        -not -path "../target/*" \
        -not -path "../replace_scripts/*" \
        -exec gsed -i \
            -e 's/sui::SUI/oct::OCT/g' \
            -e 's/sui::sui/oct::oct/g' \
            -e 's/0x2::sui::SUI/0x2::oct::OCT/g' \
            -e 's/Coin<SUI>/Coin<OCT>/g' \
            -e 's/Balance<SUI>/Balance<OCT>/g' \
            -e 's/StakedSui/StakedOct/g' \
            -e 's/staked_sui/staked_oct/g' \
            -e 's/MIST_PER_SUI/MIST_PER_OCT/g' \
            -e 's/total_sui/total_oct/g' \
            -e 's/TransferSui/TransferOct/g' \
            -e 's/transfer_sui/transfer_oct/g' \
            -e 's/PaySui/PayOct/g' \
            -e 's/pay_sui/pay_oct/g' \
            -e 's/PayAllSui/PayAllOct/g' \
            -e 's/pay_all_sui/pay_all_oct/g' \
            -e 's/pending_total_sui_withdraw/pending_total_oct_withdraw/g' \
            -e 's/module sui/module oct/g' \
            -e 's|// SUI|// OCT|g' \
            -e 's|// Sui|// Oct|g' \
        {} +

    if [ $? -eq 0 ]; then
        echo "✅ Successfully completed .move file replacements!"
    else
        echo "❌ Some replacements may have failed."
        exit 1
    fi
}

perform_replacements