#!/bin/bash

# Script to replace SUI -> OCT in .md and .mdx files (excluding target and replace_scripts)
# Uses find + gsed for global replacements

echo "Starting SUI -> OCT replacements in documentation files..."

# Function to perform replacement on .md and .mdx files
perform_replacements() {
    echo "Processing .md and .mdx files..."

    # Find all .md and .mdx files excluding target and replace_scripts directories
    find .. \( -name "*.md" -o -name "*.mdx" \) -type f \
        -not -path "../target/*" \
        -not -path "../replace_scripts/*" \
        -exec gsed -i \
            -e 's/SUI token/OCT token/g' \
            -e 's/SUI coin/OCT coin/g' \
            -e 's/SUI balance/OCT balance/g' \
            -e 's/`SUI`/`OCT`/g' \
            -e 's/0x2::sui::SUI/0x2::oct::OCT/g' \
            -e 's/Coin<SUI>/Coin<OCT>/g' \
            -e 's/Balance<SUI>/Balance<OCT>/g' \
            -e 's/StakedSui/StakedOct/g' \
            -e 's/staked_sui/staked_oct/g' \
            -e 's/MIST_PER_SUI/MIST_PER_OCT/g' \
            -e 's/total_sui/total_oct/g' \
            -e 's/TransferSui/TransferOct/g' \
            -e 's/transfer_sui/transfer_oct/g' \
            -e 's/transfer-sui/transfer-oct/g' \
            -e 's/PaySui/PayOct/g' \
            -e 's/pay_sui/pay_oct/g' \
            -e 's/pay-sui/pay-oct/g' \
            -e 's/PayAllSui/PayAllOct/g' \
            -e 's/pay_all_sui/pay_all_oct/g' \
            -e 's/pay-all-sui/pay-all-oct/g' \
            -e 's/pending_total_sui_withdraw/pending_total_oct_withdraw/g' \
            -e 's/# SUI/# OCT/g' \
            -e 's/## SUI/## OCT/g' \
            -e 's/### SUI/### OCT/g' \
        {} +

    if [ $? -eq 0 ]; then
        echo "✅ Successfully completed documentation file replacements!"
    else
        echo "❌ Some replacements may have failed."
        exit 1
    fi
}

perform_replacements