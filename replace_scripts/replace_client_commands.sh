#!/bin/bash

# Script to replace various strings in client_commands.rs

# Define the file to modify
FILE="../crates/sui/src/client_commands.rs"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File $FILE does not exist"
    exit 1
fi

# Apply replacements
gsed -i \
    -e 's/suiBalance (SUI)/balance (OCT)/g' \
    -e 's/\bsui\b/one/g' \
    -e 's/https:\/\/faucet\.devnet\.sui\.io\/v2\/gas/https:\/\/faucet-devnet.onelabs.cc\/v1\/gas/g' \
    -e 's/https:\/\/faucet\.sui\.io\/?address={address}/https:\/\/faucet-devnet.onelabs.cc\/v1\/gas/g' \
    -e 's/http:\/\/127\.0\.0\.1:9123\/v2\/gas/http:\/\/127.0.0.1:9123\/gas/g' \
    "$FILE"

# Remove the ensure! line for testnet faucet
gsed -i '/ensure!(.*!url\.starts_with("https:\/\/faucet\.testnet\.sui\.io").*"For testnet tokens, please use the Web UI: https:\/\/faucet\.sui\.io\/?address={address}");/d' "$FILE"

echo "Replacements completed in $FILE"